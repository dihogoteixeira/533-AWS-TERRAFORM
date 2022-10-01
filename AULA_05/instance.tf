resource "aws_instance" "this" {
  count         = var.amount
  ami           = "ami-01b7be8d0c978c77c"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.this.id
  tags = {
    "Name" = format("%s-%s", var.machine_name, count.index)
  }
}
