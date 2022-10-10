variable "az_count" {
  type    = number
  default = 2
}

variable "app_name" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {
    Project   = "4linux"
    Terraform = "true"
  }
}

variable "ecs_task_execution_role_name" {
  type = map(string)
  default = {
    prd = "EcsTaskExecutionRolePrd"
    hml = "EcsTaskExecutionRoleHml"
  }
}

variable "app_count" {
  type = number
}

variable "fargate_cpu" {
  type = number
}

variable "fargate_memory" {
  type = number
}

variable "definition_bucket_name" {
  type = string
}

variable "container_environment_file_name" {
  type = string
}