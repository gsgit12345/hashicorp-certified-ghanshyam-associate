provider "aws" {
  region =  "ap-south-1"
}


module "ec2_instance" {
  source = "../modules/ec2_instance"
  ami_id ="ami-0e1d06225679bc1c5"
  instance_type = "t2.micro"
  subnet_id = "subnet-0ecaebe95e49387e2"
  region_info = "ap-south-1"

}