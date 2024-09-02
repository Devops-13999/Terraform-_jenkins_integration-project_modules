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

variable "subnet_id" {
  description = "Subnet id for the subnet in which you want to create infra"
  type = string
}

variable "user_data" {
  description = "User data script to run on instance launch"
  type        = string
}

variable "security_group_id_vpc" {
  description = "security group id"
  type        = list(string)
}

variable "availability_zone" {
  description = "avaibility zone"
  type = string
}
