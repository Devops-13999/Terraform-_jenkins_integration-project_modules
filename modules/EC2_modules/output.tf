output "az" {
  value =  local.az 
}

output "env" {
  value = local.Environment
}

output "availability_zone-ec2" {
  value = aws_instance.Module_Server.availability_zone
}