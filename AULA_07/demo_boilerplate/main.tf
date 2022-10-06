# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/1.23.0

data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  count           = local.az_count
  name            = local.vpc_name
  cidr            = local.cidr
  azs             = [data.aws_availability_zones.available.names[count.index]]
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = terraform.workspace
  }
}