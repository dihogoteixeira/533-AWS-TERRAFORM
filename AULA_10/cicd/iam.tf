// RESOURCES IAM BUILD
resource "aws_iam_role" "codebuild" {
  name               = "${local.app_name}-codebuild-role"
  assume_role_policy = data.aws_iam_policy_document.assume_by_codebuild.json
}

resource "aws_iam_role_policy" "codebuild" {
  name   = "${local.app_name}-codebuild-role-policy"
  role   = aws_iam_role.codebuild.name
  policy = data.aws_iam_policy_document.codebuild.json
}

// RESOURCES IAM PIPELINE
resource "aws_iam_role" "pipeline" {
  name               = "${local.app_name}-pipeline-role"
  assume_role_policy = data.aws_iam_policy_document.assume_by_pipeline.json
}

resource "aws_iam_role_policy" "pipeline" {
  name   = "${local.app_name}-pipeline-role-policy"
  role   = aws_iam_role.pipeline.name
  policy = data.aws_iam_policy_document.pipeline.json
}

// RESOURCES IAM DEPLOY
resource "aws_iam_role" "codedeploy" {
  name               = "${local.app_name}-codedeploy-role"
  assume_role_policy = data.aws_iam_policy_document.assume_by_codedeploy.json
}

resource "aws_iam_role_policy" "codedeploy" {
  name   = "${local.app_name}-codedeploy-role-policy"
  role   = aws_iam_role.codedeploy.name
  policy = data.aws_iam_policy_document.codedeploy.json
}