data "aws_ec2_instance_type_offerings" "instance_type_offering1" {
  for_each = toset(["us-east-1c","us-east-1b","us-east-1b","us-east-1d","us-east-1e"])
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

output "offering_output2" {
 # value = data.aws_ec2_instance_type_offerings.instance_type_offering.instance_types
  value=[for instance in data.aws_ec2_instance_type_offerings.instance_type_offering1:instance.instance_types]
}
output "offering_output2_map" {
  # value = data.aws_ec2_instance_type_offerings.instance_type_offering.instance_types
  #value=[for instance in data.aws_ec2_instance_type_offerings.instance_type_offering1:instance.instance_types]
  value = {
    for ag,instance in data.aws_ec2_instance_type_offerings.instance_type_offering1: ag=>instance.instance_types
  }
}