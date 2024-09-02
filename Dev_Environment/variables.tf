# variables.tf
variable "region" {
  description = "The AWS region to deploy to."
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance."
  type        = string
}

variable "ingress_rules" {
  type = map(object({
    port = number
    description = string
    cidr = string
  }))
}

variable "env" {
  description = "Environment"
  type        = string
}

variable "cidr_vpc" {
  description = "cidr range for VPC"
  type = string
}