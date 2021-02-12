resource "aws_instance" "master" {
  ami = "ami-0996d3051b72b5b2c"
  instance_type = "t2.medium"
  key_name = "kul-labs"
  security_groups = [ aws_security_group.sg.name ]
  tags = {
    "Name" = var.tagName
  }
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("c:/training/kul-labs.pem")
      host = self.public_ip
    }
    inline = [
      "sudo hostnamectl set-hostname masterServer",
      "sudo apt-get update -y",
      "sudo apt-get install -y ansible",
      "sudo echo '${self.private_ip} masterServer >> /etc/hosts'",
      "sudo echo '[master] > /etc/ansible/hosts'",
      "sudo echo '${self.private_ip} >> /etc/ansible/hosts'"
    ]
  }
}

output "masterServer_Public_IP" {
  value = aws_instance.master.public_ip
}
