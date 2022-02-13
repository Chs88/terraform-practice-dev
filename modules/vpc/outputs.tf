
##IP addresses for network_gw
output "internet_gw_ip" {
    value = aws_internet_gateway.network-gw.id
}