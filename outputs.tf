output "role_id" {
  description = "The ID of the IAM role"
  value       = module.iam-role-for-lambda.aws_iam_role.this.id
}

output "role_arn" {
  description = "The ARN of the IAM role"
  value       = module.iam-role-for-lambda.aws_iam_role.this.arn
}