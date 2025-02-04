output "api_gateway_endpoint" {
  description = "API Gateway endpoint URL"
  value       = module.api_gateway.api_endpoint
}

output "s3_website_url" {
  description = "S3 Website URL"
  value       = module.s3_website.website_url
}
