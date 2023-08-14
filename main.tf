resource "aws_vpc" "Development" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Dev"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.Development.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}