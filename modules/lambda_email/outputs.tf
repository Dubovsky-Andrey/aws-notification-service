/*
Outputs for Lambda Email module.
*/
output "lambda_function_arn" {
  description = "The ARN of the Email Lambda function"
  value       = aws_lambda_function.email_lambda.arn
}
