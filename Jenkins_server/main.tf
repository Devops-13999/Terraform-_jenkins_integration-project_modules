data "aws_availability_zones" "available" {
  state = "available"
}
locals {
  az = slice(data.aws_availability_zones.available.names,0,3)
}

module "EC2_Module" {
  source = "../modules/EC2_modules"
  region           = var.region
  env              = var.env
  instance_type    = var.instance_type
  subnet_id = ""
  security_group_id_vpc  = [ module.Security_group_module.security_group_id ]
  availability_zone = element(local.az,0)
  user_data = <<-EOF
  #! /bin/bash
  sudo apt update
  sudo apt install -y openjdk-11-jdk
  
  curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

  sudo apt update
  sudo apt -y install jenkins
  sudo systemctl start jenkins
  sudo systemctl enable jenkins
EOF
    
  }

module "Security_group_module" {
  source = "../modules/Security_group_modules"
  ingress_rules = var.ingress_rules
  env = var.env
  vpc_id = ""
}