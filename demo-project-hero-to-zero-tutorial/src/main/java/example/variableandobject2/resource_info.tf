output "ec2_instance_info" {
  value = {

    public_ip = aws_instance.ec2_instance.public_ip
    private_ip=aws_instance.ec2_instance.private_ip
    associated_ip=aws_instance.ec2_instance.associate_public_ip_address

  }
}