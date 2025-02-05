/*
Outputs for Lambda Push module.
*/
output "lambda_function_arn" {
  description = "The ARN of the Push Lambda function"
  value       = aws_lambda_function.push_lambda.arn
}
