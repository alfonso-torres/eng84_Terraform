# Let's initialise terraform
# Providers?
# AWS

# This code will eventually launch an EC2 instance for us

# Provider is a keyword in Terraform to define the name of cloud provider

provider "aws"{
# define the region to launch the ec2 instance in Ireland	
	region = "eu-west-1"
}

# ------------------ 1. Iteration ------------------

# Create a VPC
resource "aws_vpc" "terraform_vpc_code_test"{
 cidr_block = "33.33.0.0/16"
 instance_tenancy = "default"

 tags = {
   Name = "${var.aws_vpc}"
 }
}

# Create and assign a subnet to the VPC
resource "aws_subnet" "subnet_vpc_code_test" {
  vpc_id = aws_vpc.terraform_vpc_code_test.id
  cidr_block = "33.33.1.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "${var.aws_subnet}"
  }
}

resource "aws_security_group" "jose_terraform_code_test_sg" {
 name = "jose_terraform_code_test_sg_app"
 description = "app security group"
 vpc_id = aws_vpc.terraform_vpc_code_test.id

 # Inbound rules for our app
 # Inbound rules code block:
 ingress {
  from_port = "80" # for our to launch in the browser
  to_port = "80" # for our to launch in the browser
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"] # allow all
 }
 # Inbound rules code block ends

 # Outbound rules code block
 egress{
  from_port = 0
  to_port = 0
  protocol = "-1" # allow all
  cidr_blocks = ["0.0.0.0/0"]
 }

 tags = {
  Name = "${var.aws_sg}"
 }
 # Outbound rules code block ends
}

# Create and assign an instance to the subnet
resource "aws_instance" "app_instance"{
  # add the AMI id between "" as below
  ami = var.webapp_ami_id

  # Let's add the type of instance we would like launch
  instance_type = "t2.micro"

  # Subnet
  subnet_id = aws_subnet.subnet_vpc_code_test.id

  # Security group
  vpc_security_group_ids = [aws_security_group.jose_terraform_code_test_sg.id]

  # Do we need to enable public IP for our app
  associate_public_ip_address = true

  # Tags is to give name to our instance
  tags = {
    Name = "${var.name}"
  }
}

# ------------------ 1. Iteration ends------------------


# Launch an EC2 instance from our webapp AMI
# resource is the keyword that allows us to add aws resource

#Resource block of code:

#resource "aws_instance" "app_instance"{
	# add the AMI id between "" as below
#	ami = "ami-01358d6e34043f36c"

	# Let's add the type of instance we would like launch
#	instance_type = "t2.micro"

	#AWS_ACCESS_KEY = "xxxx"
	#AWS_ACCESS_SECRET = "xxxx"
  # subnet_id = "aws_subnet.testing_subnet.id"

	# Do we need to enable public IP for our app
#	associate_public_ip_address = true

	# Specifying the key (to SSH)
	#key_name = "enter ssh key name the .pem/.pub file"
  #public_key = var.key

	# Tags is to give name to our instance
#	tags = {
#		Name = "${var.name}"
#	}
#}

# Resource block of code ends here

# Block of code to create a default vpc

#resource "aws_vpc" "terraform_vpc_code_test"{
#	cidr_block = "33.33.0.0/16"
#	instance_tenancy = "default"

# 	tags = {
#	Name = "eng84_jose_terraform_vpc"
#	}
#}

# Resource block of code ends here

# Block of code to create and assign a subnet to a vpc

#resource "aws_subnet" "subnet_vpc_code_test" {
#  vpc_id = aws_vpc.terraform_vpc_code_test.id
#  cidr_block = "33.33.1.0/24"

#  tags = {
#      Name = "eng84_jose_subnet_terraform"
#  }
#}

# Resource block of code ends here

#resource "aws_subnet" "testing_subnet" {
#  vpc_id = "vpc-07e47e9d90d2076da"
#  cidr_block = "172.31.0.0/24"

#  availability_zone = "eu-west-1a"

#  tags = {
#      Name = "var."
#  }
#}

# Security group block of code:
# security group block of code ends

# terraform init
# terraform plan
# terraform apply
# terraform destroy
