/*
Outputs for IAM module.
*/
output "apigateway_sns_role_arn" {
  description = "The ARN of the AIA gateway execution role"
  value       = aws_iam_role.apigateway_sns_role.arn
}