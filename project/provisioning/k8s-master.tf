resource "aws_instance" "k8s-master" {
	ami           	= 	"ami-01e36b7901e884a10"
	instance_type 	= 	var.master_instance_type
	key_name		= 	"kul-labs"

	security_groups = [
        aws_security_group.security_group.name
    ]
	
	tags = {
		Name 		= 	"k8s-master"
	}
	
	provisioner "remote-exec" {
	
		connection {
			type = "ssh"
			user = "centos"
			private_key = file("c:/training/kul-labs.pem")
			host = self.public_ip
		}
		inline = [
			"sudo yum install -y epel-release && sudo yum install -y ansible && sudo hostnamectl set-hostname k8s-master && sudo chown -R centos:users /etc/ansible/ && sudo echo [master] > /etc/ansible/hosts && sudo echo ${self.private_ip} >> /etc/ansible/hosts && sudo echo [worker] >> /etc/ansible/hosts"
		]
	}
}
    