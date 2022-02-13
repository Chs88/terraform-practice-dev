provider "aws" {
  region = var.default_region
  shared_credentials_files = var.credentials_path
  profile = var.profile_name
}


module "ec2" {
  
  source = "./modules/ec2"

}

module "vpc" {

  source = "./modules/vpc"
}