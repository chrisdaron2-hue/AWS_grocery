resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "grocerymate-vpc"
  }
}


resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 1)
  availability_zone = element(var.azs, count.index)

  map_public_ip_on_launch = false

  tags = {
    Name = "grocerymate-private-${count.index + 1}"
  }
}

