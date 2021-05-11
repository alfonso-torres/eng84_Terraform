# Creating variables to apply DRY using Terraform variable.tf
# These variables can be called in our main.tf

#variable "vpc_id" {
#  default = "vpc-07e47e9d90d2076da"
#}

variable "name" {
  default = "eng84_jose_terraform_nodeapp"
}

variable "webapp_ami_id" {
  default = "ami-01358d6e34043f36c"
}

variable "aws_vpc" {
  default = "eng84_jose_terraform_vpc"
}

variable "aws_subnet" {
  default = "eng84_jose_terraform_subnet"
}

variable "aws_sg" {
  default = "eng84_jose_terraform_sg"
}

#variable "aws_key_name" {
#  default = "eng84devops"
#}

#variable "aws_key_path" {
#  default = "~/.ssh/eng84devops.pem"
#}
