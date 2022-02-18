
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
    default = "t2.micro"
}

