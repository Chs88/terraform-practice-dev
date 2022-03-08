**Table of contents**
* 1 [Introduction](#introduction)
* 2 [Roadmap](#roadmap)
* 3 [.tf.vars-file](#tfvars-file)
  



# Introduction


This project is to practice Terraform. 

The first stage of the practice is to create the infrastructure and the second stage will deploy the software for the webserver and the database with their configuration to communicate. I am going to use a basic PHP app to test this. 

In the first stage, I will create a functional dev server in AWS cloud using Terraform. The infrastructure consists of a VPC (Virtual Private Cloud), two subnets (One private and one public) and two EC2 machines on their respective subnets. The EC2 machines have different roles. The one on the public subnet will act as a webserver and the one on the private subnet is running a database that is not accessible from the public internet. 
The public subnet has a NAT Gateway and the outgoing traffic from the private subnet will be routed to this NAT gateway. This NAT gateway also receives an Elastic IP address. 

All the outgoing traffic from the public subnet will be routed to an Internet Gateway. 

# Roadmap

The first stage checkpoints: 

- Create a VPC
- Create two subnets (Private - Database, Public - Webserver)
- Deploy EC2 instances to each subnet
- Apply Security group rules to each EC2 instance
- Deploy a NAT gateway to the public subnet and route outbound traffic from the private subnet to the NAT gateway. 
- Create routing table for the subnets. (The routes are all declared as seperate resources for easy readability) 
- Set up Elastic IP for the webserver and the NAT gateway


Second stage checkpoints: 

- Create the simple PHP app that will take in data pairs (Like name and occupation) and save that to a database, and make the webserver serve the data in a table on a HTML page. 
- Set up Docker on each EC2 instance. Docker is used to run the webserver and the database. 
- Final testing of the application.

# .tfvars-file

The infrastructure expects the following variables to be declared in the tfvars file: 

credentials_path = [path/to/aws-cli/] - I used AWS cli to save my credentials. They can also be declared the following way: 

```
provider "aws" {
  region     = "eu-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```

default_region = "eu-west-2" - Your AWS default region. 

profile_name = "default" - The profile name for the AWS cli. Leave blank if not used. 

infra_env = "dev" - The environment name. I used 'dev'. It is used for naming conventions. 
