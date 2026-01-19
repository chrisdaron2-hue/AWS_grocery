
resource "aws_s3_bucket" "my_bucket" {
  bucket = "elizabeth-terraform-bucket-12345"  # make this unique
  acl    = "private"
}

