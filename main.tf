provider "aws" {
  region = var.default_region
  shared_credentials_files = var.credentials_path
  profile = var.profile_name
}

### Ec2 instane for the webserver that will receive a public IP

module "web_server" {
  
  source = "./modules/ec2"

  infra_env = var.infra_env

  ec2_role = "web_server"

  subnet = module.vpc.vpc_public_subnet

  create_eip = true

  security_groups = [module.vpc.security_group_public]


}

##Ec2 instance for the machine that will run our database

module "database" {

  source = "./modules/ec2"

  infra_env = var.infra_env

  ec2_role = "database"

  subnet = module.vpc.vpc_private_subnet

  create_eip = false

  security_groups = [module.vpc.security_group_private]
}

module "vpc" {

  source = "./modules/vpc"

  infra_env = var.infra_env

  vpc_cidr = "192.0.0.0/17" ##I am going to half the default amount of IPs for now

  
}

