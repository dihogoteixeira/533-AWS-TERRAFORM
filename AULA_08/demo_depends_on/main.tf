module "vpc" {
  source     = "../modules/aws_vpc"
  cidr_block = "10.0.0.0/16"
}

module "subnet" {
  source              = "../modules/aws_subnet"
  cidr_block          = "10.10.0.0/24"
  resource_depends_on = module.vpc.id
}