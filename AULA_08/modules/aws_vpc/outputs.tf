output "id" {
  value       = aws_vpc.this.id
  description = "aws_vpc id number"
}

output "owner_id" {
  value = aws_vpc.this.owner_id
}

output "tags_all" {
  value = aws_vpc.this.tags_all
}