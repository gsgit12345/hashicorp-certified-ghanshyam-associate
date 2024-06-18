provider "aws" {
  alias = "south-1"   #it can be any name.
  region = "ap-south-1"
}
provider "aws" {
  alias = "euwest1"   #it can be any name.
  region = "eu-west-1"
}
variable "instance_type" {     #declaring input variable in terraform
  description = "ec2 instance type "
  type = string
  default = "t2.micro"
}
variable "ami_id" {
  description = "Ami id in ec2 instance"
  type = list(string)
  default = ["ami-0e1d06225679bc1c5","ami-0551ce4d67096d606"]
}
resource "aws_instance" "example" {
  ami           = var.ami_id[0]
  instance_type = var.instance_type
  provider = "aws.south-1"
}
output printfirst {
  value = "first ami id  is ${(var.ami_id[1])} and instance type is::: ${var.instance_type}"
}
resource "aws_instance" "example1" {
  ami           =var.ami_id[1]
  instance_type = var.instance_type
  provider = "aws.euwest1"
}