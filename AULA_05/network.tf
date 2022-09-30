resource "aws_vpc" "this" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "tf-vpc"
  }
}

resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name    = "subnet-us-east-1a"
    Private = "true"
  }
}
