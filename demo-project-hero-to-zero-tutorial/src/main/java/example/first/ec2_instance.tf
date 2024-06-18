terraform {
  required_providers {
    aws={
      source ="hashicorp/aws"
      version ="~> 4.16"
    }
  }
  required_version = ">= 1.2.0"

}
resource "aws_key_pair" "deployer" {
  key_name   = "demo-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDdXFtJDpCMwDcGt5Ril5iVLF498S8AvmE4EZ7KZGwtwdERLiqfAl50M7VsVm7JVKR+9RKUSN8x47K33Q8p7oMGAEQqZrZsv+rsVBjut3hwd5uaOjffYPODRO6BS2NC9lqbm3TYLu9GkX4uhIl2L5bUnjKipOMk0N+wOrQnhXvdZFwwFvutrDWyD2SeiGEQugWYlemKfC2RdDLpht5xaOTF64OC51LzJOy2Yau6rUW2CWoSHMgEYJkzI/3dqSaNRUleGGqlPCCGiQUMFKwnY9riKHoT6GhBvxOPCgJggwsdjGjYzmLuvgmCPkTWgQJ8zYPsQ4PfMc+XML+gmYIWsXM0le+KRJ5yJmHn8+T6slOj2kbXy+jKLmpN1CTZxbxvRyKh7ryiX+OTHiUSv+5cuJ1OFzvczkzV9AHDOJ0IcZeHbPe9k0d+aN4hq8bgxw+f2kSJh/BKMIboS3q36MmYK3b+19b/yEn3KxKqHLJcPKTUcuodFvH26TdyaEPkg+LR/QM= iid@master-node"
}

provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "app_server" {
  ami           = "ami-0e1d06225679bc1c5"
  instance_type = "t2.micro"
  key_name = "demo-key"
  tags = {
    name="myappserver"
  }
}
