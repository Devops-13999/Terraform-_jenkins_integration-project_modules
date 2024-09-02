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