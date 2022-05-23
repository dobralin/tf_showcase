terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 2.2.0"
    }
  }
}  


provider "aws" {
  region = "eu-west-1"	
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

output "ami_name" {
  description = "AMI string"
  value = data.aws_ami.ubuntu
}