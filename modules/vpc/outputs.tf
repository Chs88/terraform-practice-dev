output "vpc_id" {

    value = aws_vpc.main_vpc.id
}

output "vpc_cidr" {

    value = aws_vpc.main_vpc.cidr_block
  
}

output "vpc_public_subnets" {
  
    value = aws_subnet.public.cidr_block

}


output "vpc_private_subnets" {
  
    value = aws_subnet.private.cidr_block

}




##IP addresses for network_gw

output "internet_gw_ip" {
    value = aws_internet_gateway.internet_gw.id
}

