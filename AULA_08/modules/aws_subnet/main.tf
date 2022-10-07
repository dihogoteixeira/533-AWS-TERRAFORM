resource "aws_subnet" "this" {
  vpc_id            = var.resource_depends_on
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone
  tags              = merge(var.tags)

  depends_on = [
    var.resource_depends_on
  ]
}