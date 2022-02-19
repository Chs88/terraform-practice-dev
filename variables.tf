variable "credentials_path" {
  type = list
}

variable "default_region" {
  type = string
}

variable "profile_name" {
  type = string
}

variable "ec2_instance_type" {

    type = string

    description = "the type of the ec2 instance"

    default = "t2.micro"
}


variable "ec2_env" {

  type = string

  description = "infrastructure environment"
}
