resource "aws_instance" "this" {
  count         = terraform.workspace == "prd" ? 3 : 2
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    "Name" = format("%s-%s-%s", var.machine_name, terraform.workspace, count.index)
  }
}