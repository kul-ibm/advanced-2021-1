resource "aws_instance" "server" {
  ami = "ami-0996d3051b72b5b2c"
  instance_type = "t2.micro"
  tags = {
    "Name" = var.tagName
  }
  vpc_security_group_ids = [ aws_security_group.secGroup.id ]
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
