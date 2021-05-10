# Let's initialise terraform
# Providers?
# AWS

# This code will eventually launch an EC2 instance for us

# Provider is a keyword in Terraform to define the name of cloud provider

provider "aws"{
# define the region to launch the ec2 instance in Ireland	
	region = "eu-west-1"
}

# Launch an EC2 instance from our webapp AMI
# resource is the keyword that allows us to add aws resource

#Resource block of code:

resource "aws_instance" "app_instance"{
	# add the AMI id between "" as below
	ami = "ami-01358d6e34043f36c"

	# Let's add the type of instance we would like launch
	instance_type = "t2.micro"

	#AWS_ACCESS_KEY = "xxxx"
	#AWS_ACCESS_SECRET = "xxxx"

	# Do we need to enable public IP for our app
	associate_public_ip_address = true

	# Specifying the key (to SSH)
	#key_name = "enter ssh key name the .pem/.pub file"

	# Tags is to give name to our instance
	tags = {
		Name = "eng84_jose_terraform_nodeapp"
	}
}

# Resource block of code ends here

# Block of code to create a default vpc

resource "aws_vpc" "terraform_vpc_code_test"{
	cidr_block = "33.33.0.0/16"
	instance_tenancy = "default"

 	tags = {
	Name = "eng84_jose_terraform_vpc"
	}
}

# Resource block of code ends here

# Block of code to create and assign a subnet to a vpc

resource "aws_subnet" "subnet_vpc_code_test" {
  vpc_id = aws_vpc.terraform_vpc_code_test.id
  cidr_block = "33.33.1.0/24"

  tags = {
      Name = "eng84_jose_subnet_terraform"
  }
}

# Resource block of code ends here

# terraform init
# terraform plan
# terraform apply
# terraform destroy
