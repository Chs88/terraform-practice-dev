output "ubuntu_ami" {
  value = data.aws_ami.ubuntu_ami.id
}

output "app_instance" {

  value = aws_instance.project_instance.id
  
}

output "eip" {

  value = aws_eip.webserver_eip.*.public_ip ##star means it will return every eip created, which in this case either 1 or 0

}