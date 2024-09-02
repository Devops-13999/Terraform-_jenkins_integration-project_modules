region    = "ap-south-1"
env       = "prod"
instance_type = "t2.xlarge"
ingress_rules = {
  rule1 = {
    port        = 8080
    description = "Allow HTTP traffic"
    cidr        = "0.0.0.0/0"
  },
  rule2 = {
    port        = 22
    description = "Allow SSH traffic"
    cidr        = "0.0.0.0/0"
  }
}


