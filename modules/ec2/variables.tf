
##Getting the latest ubuntu AMI
data "aws_ami" "ubuntu_ami" {
  owners = ["099720109477"] ##ubuntu canonical
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}



variable "ec2_instance_type" {

    type = string

    description = "the type of the ec2 instance"

    default = "t2.micro"
}


variable "infra_env" {

  type = string

  description = "infrastructure environment"
}

variable "ec2_role" {

  type = string

  description = "the purpose of the instance"

}


variable subnet {

  type = string

  description = "valid subnet to assign the server"
  
}

variable security_groups {

  type = list(string)

  description = "security groups to assign to the server"

  default = []
}

variable "create_eip" {

  type = bool
  
  default = false
  
  description = "Wether to create an Eip or not"
  
}