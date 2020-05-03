provider "aws" {
  profile = "default"
  region  = "${var.region}"
}
resource "aws_instance" "main-ec2" {
  ami                  = "${var.ami}"
  instance_type        = "t2.micro"
  key_name             = "${var.EC2_Key}"
  iam_instance_profile = "${var.iam_instance_profile}"
  subnet_id            = "${var.subnet_id}"
  tags = {
    Name = "RedHat-WebServer"
  }
}
