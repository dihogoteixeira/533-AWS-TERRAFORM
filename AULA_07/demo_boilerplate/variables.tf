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
    "prd" = "10.0.0.0/16"
    "hml" = "10.0.0.0/16"
    "dev" = "10.0.0.0/16"
  }
}

variable "az_count" {
  type = map(any)
  default = {
    "prd" = 3
    "hml" = 2
    "dev" = 1
  }
}

variable "private_subnets" {
  type = map(any)
  default = {
    "prd" = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    "hml" = ["10.0.4.0/24", "10.0.5.0/24"]
    "dev" = ["10.0.6.0/24"]
  }
}

variable "public_subnets" {
  type = map(any)
  default = {
    "prd" = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
    "hml" = ["10.0.104.0/24", "10.0.105.0/24"]
    "dev" = ["10.0.106.0/24"]
  }
}