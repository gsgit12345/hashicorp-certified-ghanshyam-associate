####### availability zone


/*
resource "aws_instance" "ec2instance" {
  ami           = data.aws_ami.amzlinux2.id
  #instance_type = var.instance_type
  #instance_type = var.instance_type_list[0]
  instance_type = var.instance_type_map["dev"]
  user_data = file("${path.module}/apache-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id,aws_security_group.vpc_web.id]
  count=2  #it will create two ec2 instance.
  tags = {
    name="ec2instance-${count.index}"
  }

}
*/
resource "aws_instance" "ec2instance" {
  ami           = data.aws_ami.amzlinux2.id
  #instance_type = var.instance_type
  #instance_type = var.instance_type_list[0]
  instance_type = var.instance_type_map["dev"]
  user_data = file("${path.module}/apache-install.sh")
  key_name = var.instance_keypair
   #for_each = toset(data.aws_availability_zones.ec2_availability_zone.names)    # for_each only supports the map or set
  #data.aws_availability_zones.ec2_availability_zone.names  will list of availability zones.
  for_each = toset(keys({for ab, inst in data.aws_ec2_instance_type_offerings.my_instance_type:ab=>inst.instance_types if length(inst.instance_types) !=0}))-
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id,aws_security_group.vpc_web.id]
  availability_zone = each.key    # here each is the implicit object
  #count=2  #it will create two ec2 instance.in set each.value and each.key would be same but in
  # map would be different
  tags = {
    name="each-value-${each.value}"
  }

}
