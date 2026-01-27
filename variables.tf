# variables.tf

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
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

variable "vpc_a_cidr" {
  description = "CIDR block for VPC A"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_b_cidr" {
  description = "CIDR block for VPC B"
  type        = string
  default     = "10.1.0.0/16"
}

variable "subnet_a_cidr" {
  description = "CIDR block for Subnet A"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_b_cidr" {
  description = "CIDR block for Subnet B"
  type        = string
  default     = "10.0.2.0/24"
}
variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}
variable "db_name" {
  description = "The name of the RDS database"
  type        = string
  default     = "mydatabase" # or you can remove default to make it required
}





