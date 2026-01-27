# SNS Topic
resource "aws_sns_topic" "topic" {
  name = "cpu-alerts"
}

# SNS Subscription
resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = "chrisdaron2@gmail.com"
}

# CloudWatch CPU Alarm
resource "aws_cloudwatch_metric_alarm" "my_watch" {
  alarm_name          = "terraform-test-my_watch5"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80

  alarm_description = "This metric monitors EC2 CPU utilization"

  insufficient_data_actions = []
  alarm_actions             = [aws_sns_topic.topic.arn]

  dimensions = {
    InstanceId = aws_instance.app_server.id
  }
}

