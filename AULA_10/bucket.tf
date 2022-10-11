resource "aws_s3_bucket" "this" {
  bucket        = "${var.definition_bucket_name}-${data.aws_iam_account_alias.current.account_alias}"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.ecs_task_definitions_policy.json
}

resource "aws_s3_object" "this" {
  for_each = fileset("./definitions_environment", "**")

  bucket = aws_s3_bucket.this.id
  key    = each.value
  source = "./definitions_environment/${each.value}"
  etag   = filemd5("./definitions_environment/${each.value}")
}