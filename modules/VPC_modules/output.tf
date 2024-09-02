output "vpc_id" {
  value = aws_vpc.VPC.id
}

output "subnet_id" {
  value = aws_subnet.Public_Subnet.id
}

output "az" {
  value = local.az
}

output "env" {
  value = local.Environment
}

output "subnet_cidr_block" {
  value = aws_subnet.Public_Subnet.cidr_block
}
