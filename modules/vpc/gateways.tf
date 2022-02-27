##Internet gateway

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Project1-${var.infra_env}-internet_gateway"

    Environment = var.infra_env

    VPC = aws_vpc.main_vpc.id

    Project = "Project1"

    ManagedBy = "Terraform"
  }
}


##NAT gateway
##This is so that our private subnet (with the database instance on it)
# is able to connect to the internet. 
## This requires a EIP (elastic IP)

resource "aws_eip" "nat_eip" {

  vpc = true # Boolean if the eip is in a VPC or not

  lifecycle {
    ##This is if we want to keep it from destroying. In case the eip gets
    ## connected to a domain for example. For this exercise we will comment this to reduce costs. 
    # prevent_destroy = true 

  }

  tags = {

    Name = "Project1-${var.infra_env}-eip"

    Project = "Project1"

    Environment = var.infra_env

    VPC = aws_vpc.main_vpc.id

    ManagedBy = "terraform"

    Role = "private"
  }

}

resource "aws_nat_gateway" "nat_gw" {

  allocation_id = aws_eip.nat_eip.id ##Allocation ID is the eip id associated with it

  subnet_id = aws_subnet.public.id ## The NAT gateway needs to be on the public subnet
  ## The private subnet traffic will be routed to this gateway. 

  tags = {

    Name = "Project1-${var.infra_env}-nat_gw"

    Project = "Project1"

    Environment = var.infra_env

    VPC = aws_vpc.main_vpc.id

    ManagedBy = "terraform"

    Role = "private" 

  }
}