locals {
  vpc_name        = lookup(var.vpc_name, terraform.workspace, null)
  az_count        = lookup(var.az_count, terraform.workspace, null)
  cidr            = lookup(var.cidr, terraform.workspace, null)
  private_subnets = lookup(var.private_subnets, terraform.workspace, null)
  public_subnets  = lookup(var.public_subnets, terraform.workspace, null)
}