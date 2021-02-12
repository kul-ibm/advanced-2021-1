resource "aws_security_group" "sg" {
  name = var.tagName
  description = "K8S Security Group, Managed by Terraform"
  tags = {
    "Name" = var.tagName
  }
  ingress {
      from_port = "22"
      to_port = "22"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = "6443"
      to_port = "6443"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = "2379"
      to_port = "2380"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = "10250"
      to_port = "10252"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = "30000"
      to_port = "32767"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = "53"
      to_port = "53"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = "53"
      to_port = "53"
      protocol = "udp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port = "0"
      to_port = "0"
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}