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


# CloudWatch Log Group
# -----------------------------
resource "aws_cloudwatch_log_group" "demo" {
  name              = "/aws/terraform/cloud-monitoring"
  retention_in_days = 14
}

# -----------------------------
# S3 bucket for CloudTrail logs
# -----------------------------
resource "aws_s3_bucket" "cloudtrail_logs" {
  bucket = "elizabeth-terraform-cloudtrail-logs-001"
}

# -----------------------------
# CloudTrail (audit logging)
# -----------------------------

resource "aws_cloudtrail" "main" {
  name                          = "terraform-cloudtrail"
  s3_bucket_name               = aws_s3_bucket.cloudtrail_logs.id
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging               = true
}

resource "aws_s3_bucket_policy" "cloudtrail_logs_policy" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AWSCloudTrailWrite"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.cloudtrail_logs.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      },
      {
        Sid    = "AWSCloudTrailRead"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = [
          "s3:GetBucketAcl",
          "s3:GetBucketPolicy"
        ]
        Resource = aws_s3_bucket.cloudtrail_logs.arn
      }
    ]
  })
}

data "aws_caller_identity" "current" {}

 (Initial commit: CloudWatch log group, S3 bucket, and CloudTrail resources)
