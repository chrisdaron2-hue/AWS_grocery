# S3.tf

# Random suffix for S3 bucket
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# Create anonymous S3 bucket
resource "aws_s3_bucket" "avatars" {
  bucket = "grocerymate-avatars-${random_id.bucket_suffix.hex}"
}

