
data "aws_availability_zones" "my_zones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }

}

data "aws_ec2_instance_type_offerings" "my_instance_type" {
  for_each = toset(data.aws_availability_zones.my_zones.names)
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }
  filter {
    name   = "location"
    #values = ["us-east-1c"]
    values = [each.key]

  }
  location_type = "availability-zone"
}

output "output_v3_1" {
  value = {
    for ab, inst in data.aws_ec2_instance_type_offerings.my_instance_type: ab=>inst.instance_types
  }
}
output "output_v3_2" {
  value = {
    for ab, inst in data.aws_ec2_instance_type_offerings.my_instance_type:
    ab=>inst.instance_types if length(inst.instance_types) !=0
  }
}
output "output_v3_3" {
  value = keys({for ab, inst in data.aws_ec2_instance_type_offerings.my_instance_type:ab=>inst.instance_types if length(inst.instance_types) !=0})
}
output "output_v3_4" {
  value = keys({
    for ab, inst in data.aws_ec2_instance_type_offerings.my_instance_type:
    ab=>inst.instance_types if length(inst.instance_types) !=0
  })[0]
}