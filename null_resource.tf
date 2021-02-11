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

resource "null_resource" "mountEFS" {
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ubuntu"
      host = aws_instance.server.public_ip
      private_key = file("c:/training/kul-labs.pem")
    }
    inline = [
      "sudo apt-get update -y && sudo apt-get install -y nfs-common",
      "mkdir ~/efs",
      "sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${aws_efs_file_system.efs.dns_name}:/ efs"
    ]
  }
  depends_on = [ aws_efs_mount_target.mountTarget ]
}

resource "null_resource" "installAnsible" {
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ubuntu"
      host = aws_instance.server.public_ip
      private_key = file("c:/training/kul-labs.pem")
    }
    inline = [
      "sudo apt-get install -y ansible",
      "ansible --version"
    ]
  }
  triggers = {
    build = timestamp()
  }
}
