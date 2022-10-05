// Required variables
variable "vpc_cidr_block" {
  type        = string
  description = "VPC cidr block ex.: 10.10.0.0/16"
}

variable "subnet_cidr_block" {
  type        = string
  description = "SUBNET cidr block ex.: 10.10.1.0/24"
}


// Optional variables
variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "tags" {
  type = map(string)
  default = {
    Project   = "4linux"
    Terraform = "true"
  }
}