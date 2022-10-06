data "aws_iam_account_alias" "current" {}

# data "aws_caller_identity" "current" {}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document
# data "aws_iam_policy_document" "allow_access_from_current_account" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = [data.aws_caller_identity.account_id]
#     }

    # principals {
    #   type        = "Service"
    #   identifiers = ["firehose.amazonaws.com"]
    # }

    # principals {
    #   type        = "AWS"
    #   identifiers = [var.trusted_role_arn]
    # }

    # principals {
    #   type        = "Federated"
    #   identifiers = ["arn:aws:iam::${var.account_id}:saml-provider/${var.provider_name}", "cognito-identity.amazonaws.com"]
    # }

#     actions = [
#       "s3:GetObject",
#       "s3:ListBucket",
#     ]

#     resources = [
#       aws_s3_bucket.this.arn,
#       "${aws_s3_bucket.this.arn}/*",
#     ]
#   }
# }