
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



variable "ec2_instance_size" {

    type = string

    description = "the size of the ec2 instance"

    default = "t2.micro"
}


variable "env" {

  type = string

  description = "infrastructure environment"
