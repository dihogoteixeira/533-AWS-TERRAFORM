# RESOURCE ID CONSOLE
# CRIAR O RESOURCE NO ROOT MODULE


# DEPENDENCIAS NO TERRAFORM
# 1 IMPLICITA: provider 
# 1 EXPLICITA: depends_on



resource "aws_vpc" "this" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "vpc_demo"
  }
}

resource "aws_vpc" "batata" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Name = "vpc_demo_batata"
  }
}

resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name    = "demo_us-east-1a"
    Private = "true"
  }
}
