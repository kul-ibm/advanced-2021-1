data "aws_vpc" "defaultVPC" {
  filter {
    name = "tag:Name"
    values = ["default"]
  }
}

data "aws_subnet_ids" "sn-ids"{
  vpc_id = data.aws_vpc.defaultVPC.id
}
