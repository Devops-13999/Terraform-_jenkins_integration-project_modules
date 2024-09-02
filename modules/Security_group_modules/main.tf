locals {
  Environment = var.env
  Project_Name = "xyz_payment_app"
  
}
resource "aws_security_group" "allow_traffic" {
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id = var.vpc_id
  tags = {
    Name = "${local.Environment}-${local.Project_Name}-Security-Group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_inbound" {
  for_each          = var.ingress_rules
  security_group_id = aws_security_group.allow_traffic.id
  cidr_ipv4         = each.value.cidr
  from_port         = each.value.port
  to_port           = each.value.port
  ip_protocol       = "tcp"
  description       = each.value.description
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound" {
  security_group_id = aws_security_group.allow_traffic.id
  ip_protocol = "-1"
  cidr_ipv4 = "0.0.0.0/0"
}