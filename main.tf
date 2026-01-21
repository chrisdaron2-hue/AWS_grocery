

resource "aws_s3_bucket" "my_bucket" {
  bucket = "elizabeth-terraform-bucket-12345"

resource "aws_s3_bucket" "my_bucket" {
  bucket = "elizabeth-terraform-bucket-12345-2026" # add a unique suffix
  tags = {
    Name        = "my-bucket"
    Environment = "Dev"
  }
 (Initial commit: add Terraform infrastructure code)

resource "aws_s3_bucket" "my_bucket" {
  bucket = "elizabeth-terraform-bucket-12345"
}

