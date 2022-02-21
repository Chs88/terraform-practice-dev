###TO DO: Change this module to be reusable and declare the instances in the root main.tf file. 
## add the subnets to the module in a reusable way


###test resource
resource "aws_instance" "project_instance" {
  ami           = data.aws_ami.ubuntu_ami.id 

  instance_type = var.ec2_instance_type

  #subnet_id = module.vpc.aws_subnet.dev-private.id
  

  tags = { ##tag everything for easy code readability

    Name = "Project1-${var.infra_env}-${var.ec2_role}"

    Environment = var.infra_env

    Project = "Project1"

    ManagedBy = "Terraform"

    Role = var.ec2_role
  }

}

