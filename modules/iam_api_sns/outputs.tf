/*
Outputs for IAM module.
*/
output "lambda_role_arn" {
  description = "The ARN of the Lambda execution role"
  value       = aws_iam_role.apigateway_sns_role.arn
}
