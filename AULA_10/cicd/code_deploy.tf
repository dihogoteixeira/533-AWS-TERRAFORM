resource "aws_codedeploy_app" "this" {
  compute_platform = "ECS"
  name             = "${local.app_name}-codedeploy-app"
  tags             = merge(local.tags)
}

resource "aws_codedeploy_deployment_group" "this" {
  app_name               = aws_codedeploy_app.this.name
  deployment_group_name  = "${local.app_name}-deployment-group"
  service_role_arn       = aws_iam_role.codedeploy.arn
  deployment_config_name = "CodeDeployDefault.ECSAllAtOnce"
  tags                   = merge(local.tags)

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE", "DEPLOYMENT_STOP_ON_ALARM"]
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout = "CONTINUE_DEPLOYMENT"
    }

    terminate_blue_instances_on_deployment_success {
      action                           = "TERMINATE"
      termination_wait_time_in_minutes = 2
    }
  }

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  ecs_service {
    cluster_name = "${local.app_name}-ecs-cluster"
    service_name = "${local.app_name}-ecs-service"
  }

  load_balancer_info {
    target_group_pair_info {
      prod_traffic_route {
        listener_arns = [data.aws_alb_listener.selected80.arn]
      }

      target_group {
        name = data.aws_alb_target_group.blue.name
      }

      target_group {
        name = data.aws_alb_target_group.green.name
      }
    }
  }


}