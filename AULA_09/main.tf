// MODULES

module "aws_vpc" {
  source     = "./final_project/aws_vpc"
  cidr_block = "10.0.0.0/16"
}

module "aws_subnet_private" {
  source = "./final_project/aws_subnet"

  az_count                = var.az_count
  resource_vpc_id         = module.aws_vpc.id
  resource_depends_on     = module.aws_vpc
  cidr_block = module.aws_vpc.cidr_block

  depends_on = [
    module.aws_vpc
  ]
}

module "aws_subnet_public" {
  source = "./final_project/aws_subnet"

  az_count                = var.az_count
  resource_vpc_id         = module.aws_vpc.id
  resource_depends_on     = module.aws_vpc
  cidr_block = module.aws_vpc.cidr_block

  depends_on = [
    module.aws_vpc
  ]
}

// RESOURCES

resource "aws_internet_gateway" "this" {
  vpc_id = module.aws_vpc.id
}

resource "aws_route" "internet_access" {
  route_table_id         = module.aws_vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id

  depends_on = [
    module.aws_vpc
  ]
}

resource "aws_eip" "this" {
  count = var.az_count
  vpc   = true

  depends_on = [
    aws_internet_gateway.this
  ]
}

resource "aws_nat_gateway" "this" {
  count         = var.az_count
  subnet_id     = module.aws_subnet_public.*.id[count.index]
  allocation_id = aws_eip.this.*.id[count.index]
}

resource "aws_route_table" "private" {
  count  = var.az_count
  vpc_id = module.aws_vpc.id

  route = [
    {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.this.*.id[count.index]
    }
  ]

  depends_on = [
    module.aws_vpc
  ]
}

resource "aws_route_table_association" "this" {
  count          = var.az_count
  subnet_id      = module.aws_subnet_private.*.id[count.index]
  route_table_id = aws_route_table.private.*.id[count.index]
}