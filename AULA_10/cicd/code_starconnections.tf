resource "aws_codestarconnections_connection" "this" {
  name          = "${local.app_name}-codestarconnection"
  provider_type = "GitHub"
  tags          = merge(var.tags)
}