output "account_id" {
  value = data.aws_iam_account_alias.current.account_alias
}

output "id" {
  value = aws_s3_bucket.this.id
}

output "bucket_domain_name" {
  value = aws_s3_bucket.this.bucket_domain_name
}

// VPC OUTPUT
output "vpc_ids" {
  value = {
    for k, v in aws_vpc.this : k => value.id
  }

  depends_on = [
    aws_internet_gateway.this
  ]
}