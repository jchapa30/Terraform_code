resource "aws_vpc" "Development" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Dev"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id     = aws_vpc.Development.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "dev-subnet-1"
  }
}
data "aws_vpc" "existing_vpc"{
  default = true
}

resource "aws_subnet" "dev-subnet-2" {
  vpc_id     = data.aws_vpc.existing_vpc.id
  cidr_block = "172.31.48.0/20"
  avalibility_zone = "us-east-1a"


  tags = {
    Name = "dev-subnet-2"
  }
}

output "dev-vpc-id"{
  value = aws_vpc.Development.id
}

output "dev-subnet-id"{
  value = aws_subnet.dev-subnet-1.id
}