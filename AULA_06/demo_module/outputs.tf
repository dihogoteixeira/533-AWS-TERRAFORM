output "aws_vpc_id" {
  value = module.vpc_local.aws_vpc_id
}

output "aws_subnet_id" {
  value = module.vpc_local.aws_subnet_id
}

output "owner_id" {
  value = module.vpc_local.owner_id
}

output "tags_all" {
  value = module.vpc_local.tags_all
}