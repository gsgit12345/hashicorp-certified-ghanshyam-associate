terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

variable "cidr" {
  default = "10.0.0.0/16"
}
resource "aws_key_pair" "exampe_key" {
  key_name   = "demo_key"
  public_key = file("/home/iid/key/key-pair.pub")
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/16"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

}

resource "aws_internet_gateway" "ipgw" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ipgw.id
  }
}

resource "aws_security_group" "webSG" {
  name   = "web"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "Http from vpc"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ssh port from vpc"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol = "-1"  # all type of protocol and port is supported
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    web = "web-sg"
  }
}

resource "aws_instance" "myserver" {

  ami                    = "ami-0f58b397bc5c1f2e8"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.exampe_key.key_name
  vpc_security_group_ids = [aws_security_group.webSG.id]
  subnet_id              = aws_subnet.subnet1.id
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/iid/key/key-pair")
    host        = self.public_ip
  }
  # File provisioner to copy a file from local to the remote EC2 instance
  #provisioner "file" {
   # source = "/home/iid/key/appil.py"  # Replace with the path to your local file
   # destination = "/home/ubuntu/appil.py"  # Replace with the path on the remote instance
  #}
####  giving error at provisioner
  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote instance'",
      "sudo apt update -y", # Update package lists (for ubuntu)
      "sudo apt-get install -y python3-pip", # Example package installation
      #"cd /home/ubuntu",
      "sudo pip3 install flask",
     # "sudo python3 app.py &",
    ]
  }

}



