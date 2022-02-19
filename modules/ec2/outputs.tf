output "ubuntu_ami" {
  value = data.aws_ami.ubuntu_ami.id
}

output "app_instance" {

  value = aws_instance.project_instance.id
  
}