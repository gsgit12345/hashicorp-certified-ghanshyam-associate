output "instance_publicip" {
  description = "ec2 instance public ip"
  value = aws_instance.ec2instance.public_ip
}

output "instance_publicdn" {
  description = "ec2 instance public dns"
  value = aws_instance.ec2instance.public_dns
}