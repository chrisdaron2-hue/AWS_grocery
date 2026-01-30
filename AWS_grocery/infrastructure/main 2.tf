terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "eu-central-1"

}

# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

# Subnets
resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-central-1a"
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-central-1b"
}

resource "aws_db_subnet_group" "rds_subnets" {
  name = "rds-subnets-eu-central-1"
  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]

  tags = {
    Name = "rds-subnets-eu-central-1"
  }
}


# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# Security Group for EC2
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow SSH and all outbound"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2_sg"
  }
}

# Security Group for RDS
resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Allow Postgres only from EC2"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds_sg"
  }
}

#  RDS
resource "aws_db_instance" "rds" {
  engine                 = var.db_engine # postgres
  engine_version         = "15"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = var.db_username # correct spelling
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnets.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible    = false
  skip_final_snapshot    = true

  # This is the RDS instance identifier (name of the instance itself)
  identifier = "default-rds"

  # Initial database inside the instance
  db_name = var.db_name

  tags = {
    Name = "default"
  }
}

# EC2 Instance

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true
}

resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "web-server"
  }
}

# S3 Bucket ACL (recommended way)
resource "aws_s3_bucket" "app_bucket" {
  bucket = "my-app-bucket-elizabeth-2026013"
  tags = {
    Name = "app-bucket"
  }
}

# SNS Topic
resource "aws_sns_topic" "cloudwatch_alerts" {
  name = "cloudwatch-alerts"
}

# SNS Email Subscription
resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.cloudwatch_alerts.arn
  protocol  = "email"
  endpoint  = "your-email@example.com" # change to your email
}

# CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when EC2 CPU exceeds 80%"
  treat_missing_data  = "missing"

  dimensions = {
    InstanceId = aws_instance.web.id
  }

  alarm_actions = [aws_sns_topic.cloudwatch_alerts.arn]
}

