provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "ec2instancedemo" {
  ami           = "ami-0e1d06225679bc1c5"
  instance_type = "t2.micro"
  subnet_id = "subnet-0ecaebe95e49387e2"
#  region_info = "ap-south-1"

}
#resource "aws_s3_bucket" "s3_bucket" {
 # bucket = "gh-s3-demo-123"
#}

########## maintaing the locking in terraform

/*
resource "aws_dynamodb_table" "dyna_state" {
  name = "terraform-lock"  # lock table name
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "lockID"
  attribute {
    name = "lockID"
    type = "S"
  }
}
*/
