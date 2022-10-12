// RESOURCES

resource "aws_internet_gateway" "this" {
  vpc_id = module.aws_vpc.id
}

resource "aws_route" "internet_access" {
  route_table_id         = module.aws_vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id

  depends_on = [
    module.aws_vpc
  ]
}

resource "aws_eip" "this" {
  count = var.az_count
  vpc   = true

  depends_on = [
    aws_internet_gateway.this
  ]
}

resource "aws_nat_gateway" "this" {
  count         = var.az_count
  subnet_id     = module.aws_subnet_public.*.id[count.index]
  allocation_id = aws_eip.this.*.id[count.index]
}

resource "aws_route_table" "private" {
  count  = var.az_count
  vpc_id = module.aws_vpc.id

  route {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.this.*.id[count.index]
    }

  depends_on = [
    module.aws_vpc
  ]
}

resource "aws_route_table_association" "this" {
  count          = var.az_count
  subnet_id      = module.aws_subnet_private.*.id[count.index]
  route_table_id = aws_route_table.private.*.id[count.index]
}


// SGs
resource "aws_security_group" "alb" {
  name        = "${local.app_name}-sg-alb"
  description = "Controls access to ALB service"
  vpc_id      = module.aws_vpc.id
  tags        = merge(var.tags)

  ingress {
    protocol    = "tcp"
    from_port   = var.app_port
    to_port     = var.app_port
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    to_port     = 0
    from_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ecs_service" {
  name        = "${local.app_name}-sg-ecs-service"
  description = "Allow inbound access from ALB only"
  vpc_id      = module.aws_vpc.id
  tags        = merge(var.tags)

  ingress {
    protocol        = "tcp"
    from_port       = var.app_port
    to_port         = var.app_port
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    protocol    = "-1"
    to_port     = 0
    from_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// ALB RESOURCES

resource "aws_alb" "this" {
  name                             = "${local.app_name}-alb"
  subnets                          = module.aws_subnet_public.*.id
  security_groups                  = [aws_security_group.alb.id]
  tags                             = merge(var.tags)
  enable_cross_zone_load_balancing = true
}

resource "aws_alb_target_group" "this" {
  name        = "${local.app_name}-target-group"
  port        = var.app_port
  protocol    = "HTTP"
  vpc_id      = module.aws_vpc.id
  target_type = "ip"
  tags        = merge(var.tags)

  health_check {
    healthy_threshold   = "2"
    unhealthy_threshold = "2"
    interval            = "300"
    matcher             = "200"
    timeout             = "120"
    protocol            = "HTTP"
    path                = "/"
  }
}

resource "aws_alb_target_group" "green" {
  name        = "${local.app_name}-tg-green"
  port        = var.app_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
  tags        = merge(local.tags)

  health_check {
    healthy_threshold   = "2"
    unhealthy_threshold = "2"
    interval            = "300"
    matcher             = "200"
    timeout             = "120"
    protocol            = "HTTP"
    path                = var.health_check_path
  }
}

resource "aws_alb_listener" "this" {
  load_balancer_arn = aws_alb.this.id
  port              = var.app_port
  protocol          = "HTTP"
  tags              = merge(var.tags)

  default_action {
    target_group_arn = aws_alb_target_group.this.id
    type             = "forward"
    forward {
      target_group {
        arn = aws_alb_target_group.this.arn
      }

      target_group {
        arn = aws_alb_target_group.green.arn
      }
    }
  }
}