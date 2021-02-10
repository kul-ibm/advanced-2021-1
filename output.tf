output "defaultVPC_ID" {
  value = data.aws_vpc.defaultVPC.id
}
output "secGroup_ID" {
  value = aws_security_group.secGroup.id
}
output "subnet_ids" {
  value = data.aws_subnet_ids.sn-ids.ids
}
output "server_public_ip" {
  value = aws_instance.server.public_ip
}
