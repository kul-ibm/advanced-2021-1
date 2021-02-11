provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3"{
    bucket = "thinknyx"
    key = "ibm-da-feb/kul.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform-kul"
  }
}
