data "aws_iam_account_alias" "current" {}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "ecs_task_execution_role" {
  version = "2012-10-17"
  statement {
    sid     = local.ecs_task_execution_role_name
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-task.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "ecs_task_definitions_policy" {
  statement {
    actions    = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
    resources = [aws_s3_bucket.this.arn, "${aws_s3_bucket.this.arn}/*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current}:role/${aws_iam_role.ecs_task_execution_role.name}",
        "arn:aws:iam::${data.aws_caller_identity.current}:user/terraform.user"
      ]
    }
  }
}