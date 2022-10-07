// Required variables
variable "cidr_block" {
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

variable "resource_depends_on" {
  type        = any
  default     = null
  description = "Variavel utilizada para passar dependencia entre modululos."
}