data "aws_vpc" "defaultVPC" {
  filter {
    name = "tag:Name"
    values = ["default"]
  }
}
