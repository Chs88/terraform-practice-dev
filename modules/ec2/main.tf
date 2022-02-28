###TO DO: Change this module to be reusable and declare the instances in the root main.tf file. 
## add the subnets to the module in a reusable way


###test resource
resource "aws_instance" "project_instance" {
  ami           = data.aws_ami.ubuntu_ami.id 

  instance_type = var.ec2_instance_type

  
  
  vpc_security_group_ids = var.security_groups

  tags = { ##tag everything for easy code readability

    Name = "Project1-${var.infra_env}-${var.ec2_role}"

    Environment = var.infra_env

    Project = "Project1"

    ManagedBy = "Terraform"

    Role = var.ec2_role
  }

}


#eip for the web server instance
#I am going to use an eip_association resource to assciate the eip with the instance

resource "aws_eip" "webserver_eip" {

  count = (var.create_eip) ? 1 : 0 ##if var.create_eip is true create 1, if false create 0

  vpc = true

  lifecycle {
    ##This is if we want to keep it from destroying. In case the eip gets
    ## connected to a domain for example. For this exercise we will comment this to reduce costs. 
    
    # prevent_destroy = true 

  }

  tags = { ##tag everything for easy code readability

    Name = "Project1-${var.infra_env}-eip"

    Environment = var.infra_env

    Project = "Project1"

    ManagedBy = "Terraform"

    }


  }
  

##This association will associate the eip to the needed instance

  resource "aws_eip_association" "eip_assoc" {

    count = (var.create_eip) ? 1 : 0 ##if var.create_eip is true create 1, if false create 0
    
    instance_id = aws_instance.project_instance.id 

    allocation_id = aws_eip.webserver_eip[0].id ##zero index item in the list is needed because of the count reference. I will know in this case that there will only be 1 eip maximum. TODO: look at a workaround for more eips for next project
  
  }
