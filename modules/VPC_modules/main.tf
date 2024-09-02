data "aws_availability_zones" "available" {
  state = "available"
}
locals {
  az = slice(data.aws_availability_zones.available.names,0,3)
  Environment = var.env
  Project_Name = "xyz_payment_app"
}
resource "aws_vpc" "VPC" {
  cidr_block       = var.cidr_vpc
  instance_tenancy = "default"
  tags = {
    Name = "${local.Environment}-${local.Project_Name}-VPC"
  }
}

resource "aws_subnet" "Public_Subnet" {
  vpc_id = aws_vpc.VPC.id
  cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "${local.Environment}-${local.Project_Name}-Public_Subnet"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.VPC.id
  tags = {
    Name = "${local.Environment}-${local.Project_Name}-Internet_gateway"
  }
}

resource "aws_route_table" "Route_Tab" {
  vpc_id = aws_vpc.VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
  tags = {
    Name = "${local.Environment}-${local.Project_Name}-Route_Table"
  }
}

resource "aws_route_table_association" "Association" {
  route_table_id = aws_route_table.Route_Tab.id
  subnet_id = aws_subnet.Public_Subnet.id
}