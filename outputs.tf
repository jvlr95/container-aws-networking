output "vpc_id" {
  description = "SSM Parameters with the ID values vpc id"
  value       = aws_ssm_parameter.vpc.id
}

output "public_subnets" {
  description = "SSM Parameters with the ID values public subnets"
  value       = aws_ssm_parameter.public_subnets[*].id
}

output "private_subnets" {
  description = "SSM Parameters with the ID values private subnets"
  value       = aws_ssm_parameter.private_subnets[*].id
}

output "database_subnets" {
  description = "SSM Parameters with the ID values database subnets"
  value       = aws_ssm_parameter.databases_subnets[*].id
}