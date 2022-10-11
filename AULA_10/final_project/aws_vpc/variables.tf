// Required variables
variable "cidr_block" {
  type        = string
  description = "VPC cidr block ex.: 10.10.0.0/16"
}

// Optional variables
variable "tags" {
  type = map(string)
  default = {
    Project   = "4linux"
    Terraform = "true"
  }
}