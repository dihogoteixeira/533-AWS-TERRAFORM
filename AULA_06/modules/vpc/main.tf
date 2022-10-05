resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block
  tags       = merge(var.tags)
}

resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
  tags              = merge(var.tags)
}
