/*
Outputs for SNS module.
*/
output "email_topic_arn" {
  description = "SNS Email Topic ARN"
  value       = aws_sns_topic.email_topic.arn
}

output "sms_topic_arn" {
  description = "SNS SMS Topic ARN"
  value       = aws_sns_topic.sms_topic.arn
}

output "push_topic_arn" {
  description = "SNS Push Topic ARN"
  value       = aws_sns_topic.push_topic.arn
}
