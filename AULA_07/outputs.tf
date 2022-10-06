output "vpc_id" {
  value       = module.vpc[*].vpc_id[*]
  description = "List: id de todas as vpc"
}

output "azs" {
  value       = module.vpc[*].azs[*]
  description = "List: Nome de todas as AZS"
}

output "private_subnets_cidr_blocks" {
  value       = module.vpc[*].private_subnets_cidr_blocks[*]
  description = "List: id de todas as private_subnets_cidr_blocks"
}

output "public_subnets_cidr_blocks" {
  value       = module.vpc[*].public_subnets_cidr_blocks[*]
  description = "List: id de todas as public_subnets_cidr_blocks"
}

