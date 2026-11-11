output "vpc_arn" {
  description = "ARN of the vpc"
  value = module.vpc.vpc_arn
}

output "private_subnets" {
  description = "ARNs of private subnets"
  value = module.vpc.private_subnet_arns
}

output "public_subnets" {
  description = "ARNs of public subnets"
  value = module.vpc.public_subnet_arns
}