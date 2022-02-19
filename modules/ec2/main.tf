###TO DO: Change this module to be reusable and declare the instances in the root main.tf file. 
## add the subnets to the module in a reusable way


###test resource
resource "aws_instance" "test1" {
  ami           = data.aws_ami.ubuntu_ami.id 
  instance_type = var.ec2_instance_type
  subnet_id = module.vpc.aws_subnet.dev-private.id
  tags = {
    name = "test1"
  }

}
resource "aws_instance" "test2" {
  ami           = data.aws_ami.ubuntu_ami.id 
  instance_type = var.ec2_instance_type
  subnet_id = module.vpc.aws_subnet.dev-public.id
  tags = {
    name = "test2"
  }

}


