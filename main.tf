provider "aws" {
  region = var.default_region
  shared_credentials_files = var.credentials_path
  profile = var.profile_name
}

### Ec2 instane for the webserver that will receive a public IP

module "web_server" {
  
  source = "./modules/ec2"



  ec2_env = var.ec2_env

  ec2_role = "web_server"



}

##Ec2 instance for the machine that will run our database

module "database" {

  source = "./modules/ec2"

  ec2_env = var.ec2_env

  ec2_role = "database"


}

module "vpc" {

  source = "./modules/vpc"
}

# output "ubuntu_ami" {
#   value = module.ec2.ubuntu_ami
# }
 
# output "gw_ip" {
#   value = module.vpc.internet_gw_ip
# }