## Defining the security groups for our serves
#rules will be defined separately


#public security group and rules 

resource "aws_security_group" "public" {

    name = "Project1-${var.infra_env}-public-sg"

    description = "Public internet access for servers"

    vpc_id = aws_vpc.main_vpc.id





    tags = {

        Name = "Project1-${var.infra_env}-public-sg"

        Role = "public"

        Project = "Project1"

        Environment = var.infra_env

        ManagedBy = "terraform"
    }
  
}


## Public RULES

resource "aws_security_group_rule" "public_out" {

    type = "egress" ##Egress means outgoing

    from_port = 0

    to_port = 0

    ## Port range 0-0 means all ports

    protocol = "-1" ## means all protocols

    cidr_blocks = ["0.0.0.0/0"] ## means all ipv4 addresses

    security_group_id = aws_security_group.public.id ## assigned to the public security group
  
}

##TODO: Find safer methods to ssh into the server without exposing it to the internet

resource "aws_security_group_rule" "public_in_ssh" {

    type = "ingress" ##ingress means incoming

    from_port = 22

    to_port = 22 

    ## Port 22 = default ssh port

    protocol = "tcp" ## ssh works on tcp protocol

    cidr_blocks = ["0.0.0.0/0"] ## means all ipv4 addresses

    security_group_id = aws_security_group.public.id ## assigned to the public security group
  
}

resource "aws_security_group_rule" "public_in_http" {

    type = "ingress" ##ingress means incoming

    from_port = 80

    to_port = 80

    ## Port 80 = http port

    protocol = "tcp" 

    cidr_blocks = ["0.0.0.0/0"] ## means all ipv4 addresses

    security_group_id = aws_security_group.public.id ## assigned to the public security group
  
}

resource "aws_security_group_rule" "public_in_https" {

    type = "ingress" ##ingress means incoming

    from_port = 443

    to_port = 443

    ## Port 443 = https port

    protocol = "tcp" 

    cidr_blocks = ["0.0.0.0/0"] ## means all ipv4 addresses

    security_group_id = aws_security_group.public.id ## assigned to the public security group
  
}


#private security group and rules 

resource "aws_security_group" "private" {

    name = "Project1-${var.infra_env}-private-sg"

    description = "Private internet access for servers"

    vpc_id = aws_vpc.main_vpc.id





    tags = {

        Name = "Project1-${var.infra_env}-private-sg"

        Role = "private"

        Project = "Project1"

        Environment = var.infra_env

        ManagedBy = "terraform"
    }
  
}


##PRIVATE RULES

resource "aws_security_group_rule" "private_out" {

    type = "egress" ##Egress means outgoing

    from_port = 0

    to_port = 0

    ## Port range 0-0 means all ports

    protocol = "-1" ## means all protocols

    cidr_blocks = ["0.0.0.0/0"] ## means all ipv4 addresses

    security_group_id = aws_security_group.private.id ## assigned to the private security group
  
}


resource "aws_security_group_rule" "private_in" {

    type = "ingress" ##Egress means incoming

    from_port = 0

    to_port = 65535

    ## Port range 0-65535 means any port

    protocol = "-1" ## means all protocols

    cidr_blocks = [aws_vpc.main_vpc.cidr_block] ## means only addresses from our VPC are allowed

    security_group_id = aws_security_group.private.id ## assigned to the private security group
  
}