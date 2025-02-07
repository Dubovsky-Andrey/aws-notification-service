/*
This module creates an API Gateway REST API with endpoints for sending notifications.
It integrates directly with SNS topics using AWS Service integration.
*/

resource "aws_api_gateway_rest_api" "notification_api" {
  name        = "${var.project_name}-${var.environment}-notification-api"
  description = "API Gateway for Notification Platform"
}

resource "aws_api_gateway_resource" "send_email" {
  rest_api_id = aws_api_gateway_rest_api.notification_api.id
  parent_id   = aws_api_gateway_rest_api.notification_api.root_resource_id
  path_part   = "sendEmail"
}

resource "aws_api_gateway_resource" "send_sms" {
  rest_api_id = aws_api_gateway_rest_api.notification_api.id
  parent_id   = aws_api_gateway_rest_api.notification_api.root_resource_id
  path_part   = "sendSMS"
}

resource "aws_api_gateway_resource" "send_push" {
  rest_api_id = aws_api_gateway_rest_api.notification_api.id
  parent_id   = aws_api_gateway_rest_api.notification_api.root_resource_id
  path_part   = "sendPush"
}

/* Method and integration for sendEmail */
resource "aws_api_gateway_method" "post_send_email" {
  rest_api_id   = aws_api_gateway_rest_api.notification_api.id
  resource_id   = aws_api_gateway_resource.send_email.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "post_send_email_integration" {
  rest_api_id             = aws_api_gateway_rest_api.notification_api.id
  resource_id             = aws_api_gateway_resource.send_email.id
  http_method             = aws_api_gateway_method.post_send_email.http_method
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:sns:action/Publish"
  credentials = var.sns_role_arn
  
  request_templates = {
    "application/json" = <<EOF
{
  "TopicArn": "${var.email_topic_arn}",
  "Message": "$util.escapeJavaScript($input.body)"
}
EOF
  }
}

/* Method and integration for sendSMS */
resource "aws_api_gateway_method" "post_send_sms" {
  rest_api_id   = aws_api_gateway_rest_api.notification_api.id
  resource_id   = aws_api_gateway_resource.send_sms.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "post_send_sms_integration" {
  rest_api_id             = aws_api_gateway_rest_api.notification_api.id
  resource_id             = aws_api_gateway_resource.send_sms.id
  http_method             = aws_api_gateway_method.post_send_sms.http_method
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:sns:action/Publish"
  credentials = var.sns_role_arn

  request_templates = {
    "application/json" = <<EOF
{
  "TopicArn": "${var.sms_topic_arn}",
  "Message": "$util.escapeJavaScript($input.body)"
}
EOF
  }
}

/* Method and integration for sendPush */
resource "aws_api_gateway_method" "post_send_push" {
  rest_api_id   = aws_api_gateway_rest_api.notification_api.id
  resource_id   = aws_api_gateway_resource.send_push.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "post_send_push_integration" {
  rest_api_id             = aws_api_gateway_rest_api.notification_api.id
  resource_id             = aws_api_gateway_resource.send_push.id
  http_method             = aws_api_gateway_method.post_send_push.http_method
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:sns:action/Publish"
  credentials = var.sns_role_arn

  request_templates = {
    "application/json" = <<EOF
{
  "TopicArn": "${var.push_topic_arn}",
  "Message": "$util.escapeJavaScript($input.body)"
}
EOF
  }
}

resource "aws_api_gateway_deployment" "api_deployment" {
  depends_on = [
    aws_api_gateway_integration.post_send_email_integration,
    aws_api_gateway_integration.post_send_sms_integration,
    aws_api_gateway_integration.post_send_push_integration,
  ]
  rest_api_id = aws_api_gateway_rest_api.notification_api.id
  stage_name  = var.environment
}
