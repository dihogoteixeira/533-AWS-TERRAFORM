variable "ami" {
  type        = string
  description = "ID da Imagem a ser utilizada pela instacia"
  default     = "ami-01b7be8d0c978c77c"

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^ami-", var.ami))
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

# variable "amount" {
#   type = number
#   description = "Quantidade de maquinas a serem construidas"
# }

variable "machine_name" {
  type        = string
  default     = "naruto"
  description = "Prefixo do nome a ser utilizado nas instancias"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "Tipo da instancia computacional ex.: t2.micro"
}

