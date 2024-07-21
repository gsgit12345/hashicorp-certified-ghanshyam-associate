variable "cidr" {
  default = "10.0.0.0/16"
}
/*
resource "aws_key_pair" "exampe_key" {
  key_name   = "demo_key"
  public_key = file("/home/iid/key/key-pair.pub")
}
*/


resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/16"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

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



resource "aws_instance" "ec2_instance" {
  ami = "ami-04f8d7ed2f1a54b14"
  instance_type = "t2.micro"
 subnet_id = "subnet-0cd0fbdae629949a0"

  user_data = file("${path.module}/apache-install.sh")
  tags = {
    name="ec2instance"
  }
}