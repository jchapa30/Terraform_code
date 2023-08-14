resource "aws_vpc" "Development" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Dev"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id            = aws_vpc.Development.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"

}

data "aws_vpc" "existing_vpc" {
  default = true

}

resource "aws_subnet" "dev-subnet-2" {
  vpc_id            = aws_vpc.existing_vpc.id
  cidr_block        = "172.31.48.0/20"
  availability_zone = "us-east-1a"

}