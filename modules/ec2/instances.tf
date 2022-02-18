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



###test resource
resource "aws_instance" "test1" {
  ami           = data.aws_ami.ubuntu_ami.id 
  instance_type = "t2.micro"
  subnet_id = module.vpc.aws_subnet.dev-private.id
  tags = {
    name = "test1"
  }

}
resource "aws_instance" "test2" {
  ami           = data.aws_ami.ubuntu_ami.id 
  instance_type = "t2.micro"
  subnet_id = module.vpc.aws_subnet.dev-public.id
  tags = {
    name = "test2"
  }

}


