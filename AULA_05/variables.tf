# Palavras reservadas pelo Terraform

# count
# null
# source 
# version 
# providers 
# count 
# for_each 
# lifecycle 
# depends_on 
# locals
#

variable "machine_name" {
  type    = string
  default = "instance"
}

variable "amount" {
  type        = number
  default     = 3
  description = "Esperada quantidade de maquinas a serem construidas"
}

variable "instance" {
  type        = string
  description = "Tipo da instancia"
  default     = "Goku"
}

variable "subnet_id" {
  # var.subnet_id
  # var.subnet_id[*]
  # var.subnet_id[0]
  # var.subnet_id.[1]
  type    = list(any)
  default = ["sg-34875634875", 1, true, null]
}

variable "subnet_id_map" {
  type = map(string)
  default = {
    "Key" : "Value",
    "Key-1" : "Value-1",
  }
}
