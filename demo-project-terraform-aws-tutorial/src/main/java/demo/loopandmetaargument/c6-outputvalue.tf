output "print_output_list" {
  description = "for loop with description list"
  value=[for x in    aws_instance.ec2instance: x.public_dns]
}
output "print_output_map" {
  description = "for loop with description map"
  value={for instance in    aws_instance.ec2instance: instance.id=>instance.public_dns}
  #instance.id is a key and instance.public_dns is the value

}

output "print_output_map2" {
  description = "for loop with description map with advance"
  value={for c, instance in aws_instance.ec2instance : c=> instance.public_dns}
  # here c would be 0 ,1 ,2 ,3

}

output "legacy_splat_instance" {
  description = "legacy splat operator"
  #value = aws_instance.ec2instance.*.public_dns   //* is the legacy splat operator

  #value = [for instance in aws_instance.ec2instance: instance.public_dns]

  //you can write like below
  value = toset([for instance in aws_instance.ec2instance: instance.public_dns])


}
output "latest_splat_instance" {
  description = "generalized  splat operator"
  #value = aws_instance.ec2instance[*].public_dns   //[*] is the latest splat operator
  #value = [for instance in aws_instance.ec2instance: instance.public_dns]
  //  //you can write like below
  value = toset([for instance in aws_instance.ec2instance: instance.public_dns])


}
output "instance_publicdns_map" {
  // value = {for az,instance in aws_instance.ec2instance: az => instance.public_dns} //instance.public_dns or instance.id
  //tomap() example demo
  value = tomap({for az,instance in aws_instance.ec2instance: az => instance.public_dns})


}