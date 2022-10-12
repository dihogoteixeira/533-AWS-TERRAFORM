// Required variables
variable "cidr_block" {
  type        = string
  description = "VPC cidr block ex.: 10.10.0.0/16"
}

// Optional variables
variable "tags" {
  type = map(string)
  description = "to tag environments on resources"
  default = {
    Project   = "4linux"
    Terraform = "true"
  }
}