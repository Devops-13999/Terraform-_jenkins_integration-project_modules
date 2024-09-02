variable "region" {
  description = "Specify the region to provision infra"
  type = string
}

variable "instance_type" {
  description = "Instance type of ec2 service"
  type = string
}

variable "env" {
  description = "Environment for which you have to provision infra like dev/test/prod"
  type = string
}

variable "ingress_rules" {
  type = map(object({
    port = number
    description = string
    cidr = string
  }))
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  description = "Subnet id for the subnet in which you want to create infra"
  type = string
}

variable "user_data" {
  description = "User data script to run on instance launch"
  type        = string
  default     = ""
}
