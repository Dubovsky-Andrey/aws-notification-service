/*
This module creates SNS topics for Email, SMS, and Push notifications,
and subscribes the corresponding Lambda functions.
*/

resource "aws_sns_topic" "email_topic" {
  name = "${var.project_name}-${var.environment}-email-topic"
}

resource "aws_sns_topic" "sms_topic" {
  name = "${var.project_name}-${var.environment}-sms-topic"
}

resource "aws_sns_topic" "push_topic" {
  name = "${var.project_name}-${var.environment}-push-topic"
}

resource "aws_sns_topic_subscription" "email_lambda_subscription" {
  topic_arn = aws_sns_topic.email_topic.arn
  protocol  = "lambda"
  endpoint  = var.lambda_email_arn
}

resource "aws_sns_topic_subscription" "sms_lambda_subscription" {
  topic_arn = aws_sns_topic.sms_topic.arn
  protocol  = "lambda"
  endpoint  = var.lambda_sms_arn
}

resource "aws_sns_topic_subscription" "push_lambda_subscription" {
  topic_arn = aws_sns_topic.push_topic.arn
  protocol  = "lambda"
  endpoint  = var.lambda_push_arn
}
