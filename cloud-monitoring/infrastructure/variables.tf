variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "db_username" {
  description = "RDS database username"
  type        = string
}

variable "db_password" {
  description = "RDS database password"
  type        = string
  sensitive   = true
}

