output "id" {
  value       = aws_subnet.this.id
  description = "aws_subnet id number"
}

output "tags_all" {
  value = aws_subnet.this.tags_all
}