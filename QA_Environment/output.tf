output "vpc_id" {
  value = module.VPC_Module.vpc_id
}

output "subnet_id" {
  value = module.VPC_Module.subnet_id
}

output "subnet_cidr_block" {
  value = module.VPC_Module.subnet_cidr_block
}

output "env" {
  value = module.VPC_Module.env
}

output "availability_zone_ec2" {
  value = module.EC2_Module.availability_zone-ec2
}