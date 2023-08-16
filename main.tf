resource "aws_vpc" "Development" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.environment
  }
}
data "aws_vpc" "existing_vpc" {
  default = true
}


resource "aws_subnet" "dev-subnet-1" {
  vpc_id     = aws_vpc.Development.id
  cidr_block = var.subnet_cidr_block
  default    = "10.0.10.0/24"
  type       = string

  tags = {
    Name = "dev-subnet-1"
  }
}


resource "aws_subnet" "dev-subnet-2" {
  vpc_id            = data.aws_vpc.existing_vpc.id
  cidr_block        = var.subnet_cidr_block2
  availability_zone = "us-east-1a"
  type              = string

  tags = {
    Name = "dev-subnet-2"
  }
}

output "dev-vpc-id" {
  value = aws_vpc.Development.id
}

output "dev-subnet-id" {
  value = aws_subnet.dev-subnet-1.id
}
