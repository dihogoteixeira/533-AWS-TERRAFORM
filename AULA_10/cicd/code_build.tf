resource "aws_codebuild_project" "this" {
  name           = "${local.app_name}-codebuild-project"
  service_role   = aws_iam_role.codebuild.arn
  build_timeout  = 60
  queued_timeout = 480
  tags           = merge(var.tags)

  artifacts {
    name                   = "artifacts-codepipeline-bucket"
    encryption_disabled    = false
    override_artifact_name = false
    packaging              = "NONE"
    type                   = "CODEPIPELINE"
  }

  cache {
    type = "NO_CACHE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
    image_pull_credentials_type = "CODEBUILD"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true

    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = var.aws_account_id
    }

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = var.region
    }

    environment_variable {
      name  = "IMAGE_REPO_NAME"
      value = "${local.app_name}-repository"
    }
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      encryption_disabled = false
      status              = "DISABLED"
    }
  }

  source {
    buildspec = <<-EOT
            version: 0.2

            phases:
              pre_build:
                commands:
                  - echo Logging in to Amazon ECR...
                  - aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com
              build:
                commands:
                  - echo Build started on `date`
                  - echo Building the Docker image...
                  - docker build --cache-from $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME:latest --tag $IMAGE_REPO_NAME .
                  - docker tag $IMAGE_REPO_NAME:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME:latest
                  - echo Writing image definitions file...
                  - printf '{"ImageURI":"'"$AWS_ACCOUNT_ID"'.dkr.ecr.'"$AWS_DEFAULT_REGION"'.amazonaws.com/'"$IMAGE_REPO_NAME"':latest"}' > imageDetail.json
              post_build:
                commands:
                  - echo Build completed on `date`
                  - echo Pushing the Docker image...
                  - docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME:latest
            artifacts:
              files:
                - 'image*.json'
                - 'appspec.yaml'
                - 'taskdef.json'
              secondary-artifacts:
                DefinitionArtifact:
                  files:
                    - appspec.yaml
                    - taskdef.json
                ImageArtifact:
                  files:
                    - imageDetail.json
        EOT
    type      = "CODEPIPELINE"
  }
}