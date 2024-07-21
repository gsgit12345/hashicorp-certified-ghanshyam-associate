# ami-01b799c439fd5516a

data "aws_ami" "amzlinux2" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]  #  filter by ami name al2023-ami-2023.5.20240624.0-kernel-6.1-x86_64 ,al2023-ami-2023.5.20240624.0-kernel-6.1-x86_64
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
