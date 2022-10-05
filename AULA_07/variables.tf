variable "vpc_name" {
  type = map(string)
  default = {
    "prd" = "rede-prd"
    "hml" = "rede-hml"
    "dev" = "rede-dev"
  }
}

variable "cidr" {
  type = map(string)
  default = {
    "prd" = "10.10.0.0/16"
    "hml" = "10.20.0.0/16"
    "dev" = "10.30.0.0/16"
  }
}

variable "az_count" {
  type = map(any)
  default = {
    "prd" = 4
    "hml" = 2
    "dev" = 1
  }
}

variable "private_subnets" {
  type = list(any)
}

variable "public_subnets" {
  type = list(any)
}