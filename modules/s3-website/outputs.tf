output "website_url" {
  description = "URL static site"
  value       = aws_s3_bucket.static_site.website_endpoint
}
