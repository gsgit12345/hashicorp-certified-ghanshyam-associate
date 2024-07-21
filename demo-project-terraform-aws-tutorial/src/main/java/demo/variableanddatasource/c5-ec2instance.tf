resource "aws_instance" "ec2instance" {
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  user_data = file("${path.module}/apache-install.sh")
  key_name = var.instance_keypair
vpc_security_group_ids = [aws_security_group.vpc_ssh.id,aws_security_group.vpc_web.id]
  tags = {
    name="ec2instance"
  }


}