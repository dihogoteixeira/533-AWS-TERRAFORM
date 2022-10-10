locals {
  app_name = format("%s-%s", var.app_name, terraform.workspace)
  ecs_task_execution_role_name = lookup(var.ecs_task_execution_role_name, terraform.workspace, null)
}