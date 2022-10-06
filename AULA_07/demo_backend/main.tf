resource "aws_s3_bucket" "this" {
  bucket        = "${var.bucket_name}-${data.aws_iam_account_alias.current.account_alias}"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

# resource "aws_iam_policy" "this" {
#   name = "devops_team_policy"
#   path = "/"
#   policy = data.aws_iam_policy_document.allow_access_from_current_account
# }