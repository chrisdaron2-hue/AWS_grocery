############################
# Security Group
############################
resource "aws_security_group" "app_sg" {
  name        = "app-security-group"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

############################
# EC2 Instance
############################
resource "aws_instance" "app_server" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]

  tags = {
    Name = "app-ec2"
  }
}

############################
# RDS Database
############################
resource "aws_db_instance" "app_db" {
  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"
  db_name             = "appdb"
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true

  tags = {
    Name = "app-rds"
  }
}


