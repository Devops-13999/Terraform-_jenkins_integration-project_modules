region    = "ap-south-1"
env       = "prod"
cidr_vpc  = "10.0.0.0/16"
instance_type = "t2.medium"
ingress_rules = {
  rule1 = {
    port        = 80
    description = "Allow HTTP traffic"
    cidr        = "0.0.0.0/0"
  },
  rule2 = {
    port        = 22
    description = "Allow SSH traffic"
    cidr        = "0.0.0.0/0"
  }
}


