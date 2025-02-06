/*
Outputs for S3 Website module.
*/
output "website_url" {
  description = "The URL of the S3 hosted website"
  value       = aws_s3_bucket.website_bucket.website_endpoint
}
