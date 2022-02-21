##Creating the VPC

resource "aws_vpc" "main_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "Project1-${var.infra_env}-vpc"

    Environment = var.infra_env

    Project = "Project1"

    ManagedBy = "Terraform"
  }
}


##For this Project we will only create 2 subnets and not one for each availability zone
## That will happen in a later practice
##Private subnet that will not have inbound internet access

resource "aws_subnet" "private" {

  vpc_id     = aws_vpc.main_vpc.id

###This cidrsubnet() function will help us deviding the ip addresses
  cidr_block = cidrsubnet(var.vpc_cidr,8, 0)

  tags = {
    Name = "Project1-${var.infra_env}-private"

    Environment = var.infra_env

    Project = "Project1"

    ManagedBy = "Terraform"

    Role = "private"
  }
}

##Public subnet that will have inbound and outbound internet access and will house the NAT gateway

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main_vpc.id

  cidr_block = cidrsubnet(var.vpc_cidr,8, 1)

  tags = {
   
    Name = "Project1-${var.infra_env}-public"

    Environment = var.infra_env

    Project = "Project1"

    ManagedBy = "Terraform"

    Role = "public"
    }
  }
