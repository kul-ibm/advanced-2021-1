resource "aws_instance" "server" {
  ami = "ami-0996d3051b72b5b2c"
  instance_type = "t2.micro"
  tags = {
    "Name" = var.tagName
  }
  vpc_security_group_ids = [ aws_security_group.secGroup.id ]
  key_name = "kul-labs"
}

resource "aws_security_group" "secGroup" {
  name = var.tagName
  description = "Managed by Terraform"
  vpc_id = data.aws_vpc.defaultVPC.id
  tags = {
    "Name" = var.tagName
  }
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Access"
  }
}

resource "aws_ebs_volume" "ebs" {
  size = var.size
  availability_zone = aws_instance.server.availability_zone
  tags = {
    "Name" = var.tagName
  }
}

resource "aws_volume_attachment" "attachEBS" {
  volume_id = aws_ebs_volume.ebs.id
  instance_id = aws_instance.server.id
  skip_destroy = false
  force_detach = true
  device_name = "/dev/sdf"
}

resource "aws_efs_file_system" "efs" {
  creation_token = var.tagName
  tags = {
    "Name" = var.tagName
  }
}

resource "aws_efs_mount_target" "mountTarget" {
  for_each = data.aws_subnet_ids.sn-ids.ids
  file_system_id = aws_efs_file_system.efs.id
  security_groups = [ aws_security_group.secGroup.id ]
  subnet_id = each.value
}
