output "vpc_id" {

    value = aws_vpc.main_vpc.id
}

output "vpc_cidr" {

    value = aws_vpc.main_vpc.cidr_block
  
}

output "vpc_public_subnet" {
  
    value = aws_subnet.public.id

}


output "vpc_private_subnet" {
  
    value = aws_subnet.private.id

}




##IP addresses for network_gw

output "internet_gw_ip" {
    value = aws_internet_gateway.internet_gw.id
}



output "security_group_private" {

    value = aws_security_group.private.id
  
}

output "security_group_public" {

    value = aws_security_group.public.id
  
}