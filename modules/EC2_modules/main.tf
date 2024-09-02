data "aws_ami" "ami_name" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*"]
  }
}
data "aws_availability_zones" "available" {
  state = "available"
}
locals {
   az = slice(data.aws_availability_zones.available.names,0,3)
  Environment = var.env
  Project_Name = "xyz_payment_app"
  
}

resource "aws_instance" "Module_Server" {
  instance_type = var.instance_type
  availability_zone = element(local.az,0)
  ami = data.aws_ami.ami_name.id
  vpc_security_group_ids = var.security_group_id_vpc
  user_data = var.user_data
  subnet_id = var.subnet_id
  tags = {
    Name = "${local.Environment}-${local.Project_Name}-EC2"
  }
}
