##Creating the VPC
##It will use 10.0.0.0/16 CIDR block for now

resource "aws_vpc" "network" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "network"
  }
}

##Internet gateway

resource "aws_internet_gateway" "network-gw" {
  vpc_id = aws_vpc.network.id

  tags = {
    Name = "network-gw"
  }
}

##Private subnet that will not have inbound internet access

resource "aws_subnet" "dev-private" {
  vpc_id     = aws_vpc.network.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "dev-private"
  }
}

##Public subnet that will have inbound and outbound internet access and will house the NAT gateway

resource "aws_subnet" "dev-public" {
  vpc_id     = aws_vpc.network.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "dev-public"
  }
}