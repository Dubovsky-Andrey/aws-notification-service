output "website_url" {
  description = "URL static site"
  value       = aws_s3_bucket.static_site.bucket_regional_domain_name
}
