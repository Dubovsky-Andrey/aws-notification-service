/*
Outputs for API Gateway module.
*/
output "api_endpoint" {
  description = "The URL of the API Gateway endpoint"
  value       = "https://${aws_api_gateway_rest_api.notification_api.id}.execute-api.${var.aws_region}.amazonaws.com/${var.environment}/"
}
