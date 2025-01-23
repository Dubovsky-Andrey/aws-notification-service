output "role_id" {
  description = "The ID of the IAM role"
  value       = module.iam-role-for-lambda.role_id
}

output "role_arn" {
  description = "The ARN of the IAM role"
  value       = module.iam-role-for-lambda.role_arn
}

output "website_url" {
  description = "URL static site"
  value       = aws_s3_bucket.static_site.website_endpoint
}