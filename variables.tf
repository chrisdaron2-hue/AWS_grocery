# EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

# RDS database username
variable "db_username" {
  description = "RDS database username"
  type        = string
}

# RDS database password
variable "db_password" {
  description = "RDS database password"
  type        = string
  sensitive   = true
}

# Availability zones for subnets
variable "azs" {
  description = "List of availability zones for subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

