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
  description = "The ami instance type"

}
variable "instance_type" {
  description = "The EC2 instance type"
}


module "ec2_instance" {
  source = "./modules/ec2_instance"
ami = var.ami
  instance_type = var.instance_type


}