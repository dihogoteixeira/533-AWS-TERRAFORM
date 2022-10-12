locals {
  app_name = format("%s-%s", var.app_name, terraform.workspace)
}