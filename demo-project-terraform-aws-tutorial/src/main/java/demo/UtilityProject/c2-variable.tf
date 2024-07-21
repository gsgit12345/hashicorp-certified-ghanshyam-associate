variable "aws_region" {
  description = "region for the infrastructure"
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "ec2 instance tyep"
  type = string
  default = "t2.micro"
}
variable "instance_keypair" {
  description = "key paire for the ec2 instance"
  type = string
  default = "custome_key"

}
variable "instance_type_list" {
  type = list(string)
  default = ["t2.micro","t3.micro"]
}
variable "instance_type_map" {
  type = map(string)
  default ={
    "dev"="t2.micro"
    "prod"="t2.medium"
    "qa"="t2.small"
  }
}

