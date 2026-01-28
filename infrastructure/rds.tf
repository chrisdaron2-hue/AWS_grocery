resource "aws_db_subnet_group" "postgres_subnet_group" {
  name       = "postgres-subnet-group"
  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]
  tags = { Name = "Postgres DB subnet group" }
}

resource "aws_db_instance" "postgres" {
  engine              = "postgres"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  db_name             = var.db_name
  username            = "postgres_user"   
  password            = var.db_password
  skip_final_snapshot = true
  publicly_accessible = false
  vpc_security_group_ids = [aws_security_group.postgres_rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.postgres_subnet_group.name

  tags = {
    Name = "postgres-rds"
  }
}

