
###test resource
resource "aws_instance" "test" {
  ami           = "ami-0015a39e4b7c0966f" 
  instance_type = "t2.micro"

}

