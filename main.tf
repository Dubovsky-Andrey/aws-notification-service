module "iam-role-for-lambda" {
  source = "./modules/iam-role-for-lambda"

  role_name             = var.lambda_role_name
  role_path             = var.role_path
  assume_role_services  = var.assume_role_services
  enable_cloudwatchlogs = var.enable_cloudwatchlogs
  enable_sns_and_ses    = var.enable_sns_and_ses
}
