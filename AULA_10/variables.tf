variable "az_count" {
  type    = number
  default = 2
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

variable "app_name" {
  type    = string
  default = "tf-nginx"
}

variable "app_port" {
  type    = number
  default = 80
}

variable "app_count" {
  type    = number
  default = 2
}

variable "fargate_cpu" {
  type    = number
  default = 512
}

variable "fargate_memory" {
  type    = number
  default = 1024
}

variable "definition_bucket_name" {
  type    = string
  default = "definition_bucket"
}