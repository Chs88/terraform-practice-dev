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


## Route tables and routes
# I am going to define the routes separately from the route tables
##And they will be seperately associated with the subnets

# Private route table

resource "aws_route_table" "private_rt" {

  vpc_id = aws_vpc.main_vpc.id 

  tags = {
   
    Name = "Project1-${var.infra_env}-private-rt"

    Environment = var.infra_env

    Project = "Project1"

    ManagedBy = "Terraform"

    Role = "private"

    VPC = aws_vpc.main_vpc.id
    }

}

# Public route table

resource "aws_route_table" "public_rt" {

  vpc_id = aws_vpc.main_vpc.id 

  tags = {
   
    Name = "Project1-${var.infra_env}-public-rt"

    Environment = var.infra_env

    Project = "Project1"

    ManagedBy = "Terraform"

    Role = "public"

    VPC = aws_vpc.main_vpc.id
    }

}

##Private route

resource "aws_route" "private" {

  route_table_id = aws_route_table.private_rt.id

  destination_cidr_block = "0.0.0.0/0" ##Any outgoing traffic

  nat_gateway_id = aws_nat_gateway.nat_gw.id ##traffic goes through nat gw
  
}

##Public route

resource "aws_route" "public" {

  route_table_id = aws_route_table.public_rt.id

  destination_cidr_block = "0.0.0.0/0" ##Any outgoing traffic

  gateway_id = aws_internet_gateway.internet_gw.id ##traffic goes through internet gateway
  
}

##Route table associations

resource "aws_route_table_association" "private" {

  subnet_id      = aws_subnet.private.id

  route_table_id = aws_route_table.private_rt.id

}


resource "aws_route_table_association" "public" {

  subnet_id      = aws_subnet.public.id

  route_table_id = aws_route_table.public_rt.id 
  
  }

  