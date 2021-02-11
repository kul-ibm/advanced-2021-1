output "defaultVPC_ID" {
  value = data.aws_vpc.defaultVPC.id
}
output "defaultVPC_CIDR_BLOCK" {
  value = data.aws_vpc.defaultVPC.cidr_block
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
output "name" {
  value = "DNS Name for EFS Mount Targets is ${aws_efs_file_system.efs.dns_name}"
}
