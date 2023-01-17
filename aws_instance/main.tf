provider "aws" {
  region = "us-east-1"	
}

variable "instance_class" {
	type = string
	default = "t3.micro"
}

# variable "ami" {
# 	type = string
# 	default = "data"

# }
# variable "db_user" {
# 	type = string
# 	default = "user"
# }

# variable "db_password" {
# 	type = string
# 	default = "password"
# }

resource "aws_instance" "tf_envs_demo_instance_1" {
  ami           = "ami-0e50faabfd50f00cb"
  instance_type = var.instance_class
  tags = {
  	"created_by" = "Terraform TEST"
  }
}


output "ec2_instance_public_ip" {
	description = "public IP address of instance"
	value = aws_instance.tf_envs_demo_instance_1.public_ip
}

output "ec2_instance_public_dns" {
	description = "public DNS name of instance"
	value = aws_instance.tf_envs_demo_instance_1.public_dns
}
