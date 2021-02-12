# Creating CENTOS Server
resource "aws_instance" "k8s-worker" {
	ami           	= 	"ami-01e36b7901e884a10"
	instance_type 	= 	var.node_instance_type
	count 			= 	var.node_instance_count
	key_name		= 	"kul-labs"

	security_groups = [
        aws_security_group.security_group.name
    ]
		
	tags = {
		Name 		= 	"k8s-worker"
	}
	
	provisioner "remote-exec" {
		connection {
			type = "ssh"
			user = "centos"
			private_key = file(var.keyPath)
			host = aws_instance.k8s-master.public_ip
		}
		inline = [
			"sudo echo ${self.private_ip} >> /etc/ansible/hosts"
		]
	}
	
}