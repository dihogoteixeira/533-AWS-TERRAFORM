data "aws_availability_zones" "available" {}

# https://www.terraform.io/language/functions/cidrsubnet
resource "aws_subnet" "this" {
  count = var.az_count
  vpc_id            = var.resource_vpc_id
  cidr_block        = cidrsubnet(var.resource_vpc_cidr_block, 8, var.az_count + count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags              = merge(var.tags)

  depends_on = [
    var.resource_depends_on
  ]
}