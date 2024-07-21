variable "aws_region" {
  description = "region for the infrastructure"
  type = string
  default = "us-west-1"
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