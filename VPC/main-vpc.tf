provider "aws" {
  profile = "default"
  region  = "${var.region}"
}

resource "aws_vpc" "main-vpc" {
  cidr_block       = "${var.cidr_block}"
  instance_tenancy = "${var.instance_tenancy}"
  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "subnets" {
  count      = 3
  vpc_id     = "${aws_vpc.main-vpc.id}"
  cidr_block = "${element(var.subnet_cidr, count.index)}"
  tags = {
    //Name = "${element(var.subnet_cidr, count.index)}subnet0${count.index + 1}"
    Name = "subnet0${count.index + 1}-${element(var.subnet_cidr, count.index)}"
  }
}

output "vpc_id" {
  value = "${aws_vpc.main-vpc.id}"
}

output "subnet_id" {
  value = "${aws_subnet.subnets.*.id}"
}
