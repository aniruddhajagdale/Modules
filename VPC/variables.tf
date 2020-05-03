variable "region" {
  default = "ap-south-1"
}
variable "cidr_block" {
  default = "10.0.0.0/16"
}
variable "subnet_cidr" {
  type    = "list"
  default = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
}
variable "instance_tenancy" {
  default = "default"
}



