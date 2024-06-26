variable "ec2_instance" {
  description = "filtering example in the terraform"
  type = list(object({
    instanceType=string
    instanceName=string
    required_type=bool
  }))

  default =[
    {
      instanceType="t3.micro"
      instanceName="spot"
      required_type=true
  },
    {
      instanceType="t3.medium"
      instanceName="instant"
      required_type=false
    },
    {
      instanceType  = "t2.micro"
      instanceName  = "ondemand"
      required_type = true
    },
    {
      instanceType="t1.micro"
      instanceName="ondemandsuper"
      required_type=false
    }
  ]
}
locals {
  instance_require=toset([for hello in var.ec2_instance:
          hello.instanceName if hello.required_type==true])

}
output "print_required_instancetype" {
  value = local.instance_require
}

##https://dev.to/pwd9000/terraform-filter-results-using-for-loops-4n75