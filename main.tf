provider "aws" {
  region = var.default_region
  shared_credentials_files = var.credentials_path
  profile = var.profile_name
}



module "ec2" {
  
  source = "./modules/ec2"



  ec2_env = var.ec2_env

  ec2_role = "web_server"



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