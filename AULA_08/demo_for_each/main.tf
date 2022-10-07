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

/* 

for_each = ../shared/html/*.* 
1. index.hml
  - each.value = ../shared/html/index.hml

2. sh.js
  - each.value = ../shared/html/sh.js

3. style.css
  - each.value = ../shared/html/style.css

*/

resource "aws_s3_object" "this" {
  for_each = fileset("../shared/html", "**")

  bucket = aws_s3_bucket.this.id
  key    = each.value
  source = "../shared/html/${each.value}"
  etag   = filemd5("../shared/html/${each.value}")
}