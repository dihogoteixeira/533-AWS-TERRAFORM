output "id" {
  value       = aws_vpc.this.id
  description = "aws_vpc id number"
}

output "owner_id" {
  value = aws_vpc.this.owner_id
}

output "main_route_table_id" {
  value = aws_vpc.this.main_route_table_id
}

output "cidr_block" {
  value = aws_vpc.this.cidr_block
}