module "vpc_local" {
  source            = "../modules/vpc"
  vpc_cidr_block    = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
}

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