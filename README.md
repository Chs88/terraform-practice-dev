# terraform-practice-dev

This project is to practice Terraform. 

I will create a fully functional Dev server on AWS that will automatically pull changes for a basic web application from Github using Jenkins and deploy those changes to the webserver. 

This will be done in two stages.

First stage is to create the environment for the EC2 instances that will run the webserver and the database server, respectively. 
Second stage will be the creation of the server that runs Jenkins. 

The first stage checkpoints: 

- Create a VPC
- Create two subnets (Private - Database, Public - Webserver)
- Set up NACL for each subnet
- Deploy EC2 instances to each subnet
- Apply Security group rules to each EC2 instance
- Deploy a NAT gateway to the public subnet and route outbound traffic from the private subnet to the NAT gateway. 
- Create routing table for the whole VPC
- Deploy Docker on each EC2 instance and deploy the respective clients on them (Database, Webserver)
- Set up Elastic IP for the webserver

