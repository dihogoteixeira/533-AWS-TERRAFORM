resource "aws_codepipeline" "this" {
  name     = "${local.app_name}-codepipeline"
  role_arn = aws_iam_role.pipeline.arn
  tags     = merge(var.tags)

  artifact_store {
    location = "artifacts-codepipeline-bucket"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      namespace        = "SourceVariables"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      run_order        = 1
      output_artifacts = ["SourceArtifact"]

      configuration = {
        BranchName           = "develop"
        ConnectionArn        = aws_codestarconnections_connection.this.arn
        FullRepositoryId     = "2TDST/dimdim-backend"
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      namespace        = "BuildVariables"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      run_order        = 1
      version          = "1"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["ImageArtifact", "DefinitionArtifact"]

      configuration = {
        ProjectName = aws_codebuild_project.this.arn
      }
    }
  }


}