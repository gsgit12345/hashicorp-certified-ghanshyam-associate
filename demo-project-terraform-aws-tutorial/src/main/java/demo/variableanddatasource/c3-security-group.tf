resource "aws_security_group" "vpc_ssh" {
  description = "security group  for the ec2 instance"
  name = "vpc_ssh"
  ingress {
    //inbound rule
    description = "allow port 22 from the ec2"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "allow all ip and port outbound"
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name="vpc_ssh"
  }
}

############333  security group for web traffic
resource "aws_security_group" "vpc_web" {
  description = "security group  for the ec2 instance"
  name = "vpc_web"
  ingress {
    //inbound rule
    description = "allow port 80 from the ec2"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    //inbound rule
    description = "allow port 443 from the ec2"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "allow all ip and port outbound"
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name="vpc_web"
  }
}