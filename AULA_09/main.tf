// MODULES

module "aws_vpc" {
  source     = "./final_project/aws_vpc"
  cidr_block = "10.0.0.0/16"
}

module "aws_subnet_private" {
  source = "./final_project/aws_subnet"

  az_count                = var.az_count
  resource_vpc_id         = module.aws_vpc.id
  resource_depends_on     = module.aws_vpc
  cidr_block = module.aws_vpc.cidr_block

  depends_on = [
    module.aws_vpc
  ]
}

module "aws_subnet_public" {
  source = "./final_project/aws_subnet"

  az_count                = var.az_count
  resource_vpc_id         = module.aws_vpc.id
  resource_depends_on     = module.aws_vpc
  cidr_block = module.aws_vpc.cidr_block

  depends_on = [
    module.aws_vpc
  ]
}
