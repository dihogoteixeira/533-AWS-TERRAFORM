output "aws_vpc_id" {
  value       = aws_vpc.this.id
  description = "aws_vpc id number"
}

output "aws_subnet_id" {
  value       = aws_subnet.this.id
  description = "aws_subnet id number"
}

output "owner_id" {
  value = aws_vpc.this.owner_id
}

output "tags_all" {
  value = aws_subnet.this.tags_all
}