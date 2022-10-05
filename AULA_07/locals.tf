locals {
  vpc_name = lookup(var.vpc_name, terraform.workspace, null)
  az_count = lookup(var.az_count, terraform.workspace, null)
}