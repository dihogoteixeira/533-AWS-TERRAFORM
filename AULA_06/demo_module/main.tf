module "vpc_local" {
  source            = "../modules/vpc"
  vpc_cidr_block    = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
}

module "vpc_rest_github" {
  source            = "git@github.com:dihogoteixeira/aws_vpc_module.git?ref=0.1.0"
  vpc_cidr_block    = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
}

/*
./aws_modules/
../vpc
../subnet
../instance

.:: UTILIZANDO MODULOS EM UM MESMO REPOSITÓRIO ::.

module "vpc" {
  source            = "git@github.com:dihogoteixeira/aw_modules.git//vpc"
  ...
}

module "subnet" {
  source            = "git@github.com:dihogoteixeira/aw_modules.git//subnet"
  ...
}

module "instance" {
  source            = "git@github.com:dihogoteixeira/aw_modules.git//instance"
  ...
}
*/


# module "vpc_scm" {
#   source = "git@github.com:dihogoteixeira/533-AWS-TERRAFORM.git?ref=1.23.0"
# }

# module "vpc_public_registry" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "1.23.0"
# }

# // https://www.terraform.io/internals/module-registry-protocol
# module "pvc_module_registry_protocol" {
#   source  = "sub.private.domain.com/{namespace}/{provider}"
#   version = "1.23.0"
# }