variable "app_name" {
  type    = string
  default = "tf-nginx"
}

variable "tags" {
  type = map(string)
  default = {
    Project   = "4linux"
    Terraform = "true"
  }
}