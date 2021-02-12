resource "aws_instance" "node" {
  ami = "ami-0996d3051b72b5b2c"
  instance_type = "t2.micro"
  key_name = "kul-labs"
  security_groups = [ aws_security_group.sg.name ]
  tags = {
    "Name" = "${var.tagName}-Node"
  }
}