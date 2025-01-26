module "iam-role-for-lambda" {
  source = "./modules/iam-role-for-lambda"

  role_name             = var.role_name
  role_path             = var.role_path
  assume_role_services  = var.assume_role_services
  enable_cloudwatchlogs = var.enable_cloudwatchlogs
  enable_sns_and_ses    = var.enable_sns_and_ses
}

module "s3-website" {
  source = "./modules/lambda-functions"
  function_name = var.function_name
  runtime = var.runtime
  handler = var.handler
  architectures =  var.architectures
  filename =  var.filename
  source_code_hash= var.source_code_hash
  role= module.iam-role-for-lambda.role_arn
}

module "s3-website" {
  source = "./modules/s3-website"

  bucket_name        = var.bucket_name
  index_document     = var.index_document
  error_document     = var.error_document
  website_files_path = var.website_files_path
  aws_region         = var.aws_region
}
