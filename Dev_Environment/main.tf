module "EC2_Module" {
  source = "../modules/EC2_modules"
  region           = var.region
  security_group_id_vpc  = [ module.Security_group_module.security_group_id ]
  env              = var.env
  instance_type    = var.instance_type
  subnet_id = module.VPC_Module.subnet_id
  user_data =  <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y nginx
              sudo systemctl start nginx
              EOF

}

module "VPC_Module" {
  source = "../modules/VPC_modules"
  region = var.region
  env = var.env
  cidr_vpc = var.cidr_vpc
  subnet_cidr_block = cidrsubnet(var.cidr_vpc,8,0)
  availability_zone = element(module.VPC_Module.az,0)
}

module "Security_group_module" {
  source = "../modules/Security_group_modules"
  env = var.env
  ingress_rules = var.ingress_rules
  vpc_id = var.cidr_vpc
}
