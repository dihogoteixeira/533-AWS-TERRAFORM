variable "bucket_name" {
  type    = string
  default = "tf-bucket-for-each"
}

variable "vpcs" {
  type = map(object({
    cidr_block = string
  }))
}