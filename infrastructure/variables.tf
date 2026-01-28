variable "alert_email" {
  description = "Email address to receive CloudWatch alerts"
  type        = string
}

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"  # optional default
}

variable "db_name" {
  description = "The name of the PostgreSQL database"
  type        = string
}

variable "db_username" {
  description = "Username for the PostgreSQL database"
  type        = string
}

variable "db_password" {
  description = "Password for the PostgreSQL database"
  type        = string
  sensitive   = true
}

