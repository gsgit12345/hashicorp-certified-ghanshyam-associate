variable "users" {
  type = object({
    name  = string
    email = string
    age   = number
    phone = any
  })
  default = {
    name  = "harish"
    email = "harish@gmail.com"
    age   = 123
    phone = 987663667
  }
}
output "printuserinfo" {
  value = "name is:${var.users.name} and email is:${var.users.email} and age is ${var.users.age}"
}
################### map example
variable "region" {
  description = "this is the map example"
  type        = map(string)
  default = {
    ami1 = "amifor apsouth"
    ami2 = "ami for the southwest"
    ami3 = "ami for the us central"
    ami4 = "ami for eu east"
  }
}
  ##############accesing map value
 output "printmap" {
   value = "ami-1 is :${var.region.ami1} and ami--2 is ${var.region.ami2} and ami---3 is : ${var.region.ami3}"
 }
###################  map with object
variable "complex_map" {

  type = map(object({
    name=string
    email=string
    age=number
    isMoreOld=bool

  }))
  default = {
    key1={
      name="harish"
      email="xyz@gmail.com"
      age=100
      isMoreOld=false

  }
    key2 = {
      name="ramesh"
      email="ramesh@gmail.com"
      age=90
      isMoreOld=true
    }
    key3 ={
      name="suresh"
      email="suresh@gmail.com"
      age=110
      isMoreOld=true
    }
  }
}

##########3 accesing the object from map

output "printcomplexobjectfrommap" {
  value = "first value in map:: tostring(${var.complex_map.key1.age}) "
}

################## list
variable "ec2_instance" {
  description = "this is the demo for list"
  type = list(string)
  default = [
    "spot instance",
    "demoinstance",
    "fullproofinstance",
    "instanceforsouth"
  ]
}

output "printlist" {
  value = "first value in list ${var.ec2_instance[0]} and second ${var.ec2_instance[1]} and third value ${var.ec2_instance[2]}"
}

