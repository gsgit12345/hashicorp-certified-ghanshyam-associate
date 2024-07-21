terraform {
  required_providers {
    aws={
      source ="hashicorp/aws"
      version ="~> 4.16"
    }
  }
  required_version = ">= 1.2.0"

}
provider "aws"{
  region = "ap-south-1"

}
variable "helo" {
  type = string
  default = "hello with different provider name"
}
output "print" {
  value = var.helo
}

#resource "aws_instance" "ec2_instance1" {   # ec2_instance is the resource local name
                                            # it shouild be unique in a module.
  // argument will go below like ami etc
  //ec2_instance is the level  and it is resource local name
  //aws_instance  --it is resource type
#}