
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-central-1"  # ✅ literal value, not var.region
}

variable "db_engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"
}

variable "db_name" {
  description = "The name of the RDS database"
  type        = string
  default     = "defaultdb"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Database password"
  type        = string
  default     = "Password123!"
  sensitive   = true
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  sensitive   = true
}
