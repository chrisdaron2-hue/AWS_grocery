# DB Subnet Group for Private RDS
resource "aws_db_subnet_group" "rds" {
  name       = "grocerymate-rds-subnet-group"
  subnet_ids = aws_subnet.private[*].id # references the private subnets

  tags = {
    Name = "grocerymate-rds-subnet-group"
  }
}

# Private RDS Instance
resource "aws_db_instance" "postgres" {
  identifier        = "grocerymate-db"
  engine            = "postgres"
  engine_version    = "15"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "grocerymate"
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.rds.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  publicly_accessible = false
  skip_final_snapshot = true

  tags = {
    Name        = "grocerymate-db"
    Environment = "Dev"
  }
}

