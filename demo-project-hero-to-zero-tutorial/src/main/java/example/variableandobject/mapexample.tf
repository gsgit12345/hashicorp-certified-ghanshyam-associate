
variable "mapoflist" {
  description = "this is the example of map of list of string type"
  type = map(list(string))
  default = {
    name=["ramesh","suresh"]
    age=["12","32"]
  }
}







##########################3333  printing the input variable

output "printmapoflist" {
  value = "printing the mapoflist:${var.mapoflist.name[0]}"
}