##Creating the VPC
##It will use 10.0.0.0/16 CIDR block for now

resource "aws_vpc" "main-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "main-vpc"
  }
}

##Internet gateway

resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "internet-gw"
  }
}

##Private subnet that will not have inbound internet access

resource "aws_subnet" "dev-private" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr,8, 0)

  tags = {
    Name = "dev-private"
  }
}

##Public subnet that will have inbound and outbound internet access and will house the NAT gateway

resource "aws_subnet" "dev-public" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr,8, 1)

  tags = {
    Name = "dev-public"
  }
}