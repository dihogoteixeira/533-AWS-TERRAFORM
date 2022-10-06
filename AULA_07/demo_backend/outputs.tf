output "account_id" {
  value = data.aws_iam_account_alias.current.account_alias
}

output "id" {
  value = aws_s3_bucket.this.id
}

output "bucket_domain_name" {
  value = aws_s3_bucket.this.bucket_domain_name
}