terraform {
  required_providers {
    aws={
      source ="hashicorp/aws"
      version ="~> 4.16"
    }
  }
  required_version = ">= 1.2.0"

}

provider "aws" {
  region = "ap-south-1"
}

variable "ami" {
  description = "this is the ami "
}
variable "instance_type" {
  description = "this is the ec2 instance type desc"
#default = "ami-0e1d06225679bc1c5"
}
resource "aws_instance" "example_instance" {
   ami = var.ami
  instance_type = var.instance_type
  subnet_id = "subnet-0cd0fbdae629949a0"
  tags = {
    name="modue instance"
  }
}