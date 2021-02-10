output "defaultVPC_ID" {
  value = data.aws_vpc.defaultVPC.id
}
output "secGroup_ID" {
  value = aws_security_group.secGroup.id
}
