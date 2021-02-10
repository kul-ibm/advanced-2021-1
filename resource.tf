resource "aws_instance" "server" {
  ami = "ami-0996d3051b72b5b2c"
  instance_type = "t2.micro"
}