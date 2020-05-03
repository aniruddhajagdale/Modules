module "tf-vpc" {
  source     = "C:\\Terraform Lab\\Modules\\VPC"
  region     = "ap-south-1"
  cidr_block = "10.0.0.0/16"
  //subnet_cidr = "${module.tf-vpc.subnet_id[0]}"
}
module "tf-ec2" {
  source               = "C:\\Terraform Lab\\Modules\\EC2"
  ami                  = "ami-052c08d70def0ac62"
  region               = "ap-south-1"
  iam_instance_profile = "s3-admin-access"
  EC2_Key              = "EC2 Key"
  subnet_id            = "${module.tf-vpc.subnet_id[0]}"
}
