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
    Name = "WebServer"
  }
  connection  {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:\\Users\\ajagdale\\Documents\\EC2 Key")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo aws s3 cp s3://s3-aniruddha/index.html /var/www/html/",
      "sudo service httpd start",
      "sudo chkconfig httpd on"
    ]
  }
}
