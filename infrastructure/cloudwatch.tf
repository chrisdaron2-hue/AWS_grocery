
# SNS Topic for CloudWatch Alerts

resource "aws_sns_topic" "cloudwatch_alerts" {
  name = "cloudwatch-alerts"
}


# SNS Email Subscription

resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.cloudwatch_alerts.arn
  protocol  = "email"
  endpoint  = chrisdaron2@gmail.com
}


# CloudWatch Alarm – High EC2 CPU

resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when EC2 CPU exceeds 80%"
  treat_missing_data  = "missing"

  dimensions = {
    InstanceId = aws_instance.app_instance.id
  }

  alarm_actions = [aws_sns_topic.cloudwatch_alerts.arn]
}

