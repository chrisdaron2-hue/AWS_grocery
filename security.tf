# Security Group for RDS
resource "aws_security_group" "rds" {
  name        = "grocerymate-rds-sg"
  description = "Allow database access from app servers only"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # allows access from inside the VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "grocerymate-rds-sg"
  }
}

