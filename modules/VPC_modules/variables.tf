variable "env" {
  description = "Environment for which you have to provision infra like dev/test/prod"
  type = string
}

variable "cidr_vpc" {
  description = "cidr range for VPC"
  type = string
}

variable "region" {
  description = "Specify the region to provision infra"
  type = string
}

variable "subnet_cidr_block" {
  description = "Specify the cidr block for subnet"
  type = string
}

variable "availability_zone" {
  description = "Specify the avaibility zone"
  type = string
}