/*
Outputs for Lambda SMS module.
*/
output "lambda_function_arn" {
  description = "The ARN of the SMS Lambda function"
  value       = aws_lambda_function.sms_lambda.arn
}
