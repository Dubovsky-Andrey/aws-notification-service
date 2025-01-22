output "instances_public_ips" {
  value = module.ec2-count.instances_public_ips
}

output "role_id" {
  description = "The ID of the IAM role"
  value       = module.iam-role-for-lambda.aws_iam_role.this.id
}

output "role_arn" {
  description = "The ARN of the IAM role"
  value       = module.iam-role-for-lambda.aws_iam_role.this.arn
}