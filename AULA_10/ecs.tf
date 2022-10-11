resource "aws_ecs_cluster" "this" {
  name = "${local.app_name}-ecs-cluster"
  tags = merge(var.tags)
}

resource "aws_ecs_task_definition" "this" {
  family                   = "${local.app_name}-task-definition"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  tags                     = merge(var.tags)

  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition
  # https://www.terraform.io/language/functions/jsonencode
  container_definitions = jsonencode(
    [
      {
        environmentFiles = [
          {
            # DONE: criar o bucket de definitions!
            "value" : "arn:aws:s3:::${var.definition_bucket_name}/app_container_${terraform.workspace}.env"
            "type" : "s3"
          }
        ],
        name      = "${local.app_name}-container"
        cpu       = var.fargate_cpu
        memory    = var.fargate_memory
        essential = true
        image     = "nginx"
        # image = format("%s:%s", aws_ecr_repository.this.repository_url, "latest")
        network_mode = "awsvpc"
        mountPoints  = []
        logConfiguration = {
          logDriver = "awslogs"
          options = {
            awslogs-group         = "/fargate/service/${local.app_name}"
            awslogs-region        = "us-east-1"
            awslogs-stream-prefix = "ecs"
          }
        }
        portMappings = [
          {
            containerPort = var.app_port
            hostPort      = var.app_port
            protocol      = "tcp"
          },
          {
            containerPort = 443
            hostPort      = 443
            protocol      = "tcp"
          }
        ]
      }
    ]
  )
}

resource "aws_ecs_service" "this" {
  name                              = "${local.app_name}-ecs-service"
  task_definition                   = aws_ecs_task_definition.this.arn
  cluster                           = aws_ecs_cluster.this.id
  desired_count                     = var.app_count
  launch_type                       = "FARGATE"
  tags                              = merge(var.tags)
  propagate_tags                    = "SERVICE"
  health_check_grace_period_seconds = 0

  network_configuration {
    subnets          = module.aws_subnet_private.*.id
    security_groups  = [aws_security_group.ecs_service.id]
    assign_public_ip = true
  }

  load_balancer {
    # DONE:  criar ALB e seus demais resources!
    target_group_arn = aws_alb_target_group.this.arn
    container_name   = "${local.app_name}-container"
    container_port   = var.app_port
  }

  deployment_controller {
    type = "CODE_DEPLOY"
  }

  depends_on = [
    aws_iam_role_policy_attachment.ecs_task_execution_role,
    aws_alb_listener.this
  ]
}