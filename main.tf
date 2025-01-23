module "iam-role-for-lambda" {
  source = "./modules/iam-role-for-lambda"


  role_name             = var.role_name
  role_path             = var.role_path
  assume_role_services  = var.assume_role_services
  enable_cloudwatchlogs = var.enable_cloudwatchlogs
  enable_sns_and_ses    = var.enable_sns_and_ses
}

module "s3-website" {
  source = "./modules/s3-website"

  bucket_name        = var.bucket_name
  index_document     = var.index_document
  error_document     = var.error_document
  website_files_path = var.website_files_path
  aws_region         = var.aws_region
}
