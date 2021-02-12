resource "aws_instance" "node" {
  ami = "ami-0996d3051b72b5b2c"
  instance_type = "t2.micro"
  key_name = "kul-labs"
  security_groups = [ aws_security_group.sg.name ]
  tags = {
    "Name" = "${var.tagName}-Node"
  }
  count = 2
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("c:/training/kul-labs.pem")
      host = aws_instance.master.public_ip
    }
    inline = [
      "sudo echo ${self.private_ip} >> /etc/ansible/hosts"
    ]
  }
}

output "Nodes_private_IP" {
  value = aws_instance.node.*.private_ip
}
