resource "aws_instance" "web" {
  ami           = 2
  instance_type = "t3.micro"

  tags = {
    Name = "web"
  }
}

resource "aws_instance" "web-1" {
  ami           = ""
  instance_type = "t3.micro"

  tags = {
    Name = "web-1"
  }
}