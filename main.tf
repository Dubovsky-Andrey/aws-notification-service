
module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
  environment  = var.environment
}

module "lambda_email" {
  source       = "./modules/lambda_email"
  project_name = var.project_name
  environment  = var.environment
  iam_role_arn = module.iam.lambda_role_arn
}

module "lambda_sms" {
  source       = "./modules/lambda_sms"
  project_name = var.project_name
  environment  = var.environment
  iam_role_arn = module.iam.lambda_role_arn
}

module "lambda_push" {
  source       = "./modules/lambda_push"
  project_name = var.project_name
  environment  = var.environment
  iam_role_arn = module.iam.lambda_role_arn
}

# module "sns" {
#   source           = "./modules/sns"
#   project_name     = local.project_name
#   environment      = local.environment
#   lambda_email_arn = module.lambda_email.lambda_function_arn
#   lambda_sms_arn   = module.lambda_sms.lambda_function_arn
#   lambda_push_arn  = module.lambda_push.lambda_function_arn
# }

# module "api_gateway" {
#   source          = "./modules/api_gateway"
#   project_name    = local.project_name
#   environment     = local.environment
#   aws_region      = var.aws_region
#   email_topic_arn = module.sns.email_topic_arn
#   sms_topic_arn   = module.sns.sms_topic_arn
#   push_topic_arn  = module.sns.push_topic_arn
# }

# module "s3_website" {
#   source       = "./modules/s3_website"
#   project_name = local.project_name
#   environment  = local.environment
#   api_endpoint = module.api_gateway.api_endpoint
# }
