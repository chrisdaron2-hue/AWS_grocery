resource "aws_s3_bucket" "avatars" {
<<<<<<< HEAD
  bucket = "grocerymate-avatars-2026-elizabeth"
=======
  bucket = "grocerymate-avatars-2026-elizabeth-001"  # updated
>>>>>>> c29d763 (Initial commit: add Terraform infrastructure code)
  tags = {
    Name        = "grocerymate-avatars"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "avatars_versioning" {
  bucket = aws_s3_bucket.avatars.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "avatars_sse" {
  bucket = aws_s3_bucket.avatars.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


