resource "null_resource" "mountEBS" {
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ubuntu"
      host = aws_instance.server.public_ip
      private_key = file("c:/training/kul-labs.pem")
    }
    inline = [
      "sudo mkfs -t ext4 /dev/xvdf",
      "sudo mount /dev/xvdf /opt",
      "sudo chown ubuntu:ubuntu /opt"
    ]
  }
  depends_on = [ aws_volume_attachment.attachEBS ]
}
