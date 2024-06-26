terraform {
  required_providers {
    aws={
      source="hashicorp/aws"
      version="~>4.16"
    }
  }
  required_version = ">= 1.2.0"
}
provider "aws" {
  region = var.region_info
}
resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
}