# IAM role 
environment           = "prod"
project               = "project-name"
aws_region            = "us-east-1"
role_name             = "LambdaRole"
role_path             = "/"
assume_role_services  = ["lambda.amazonaws.com"]
enable_cloudwatchlogs = true
enable_sns_and_ses    = true

# S3 and website configuration
bucket_name           = "dubovsky-andrey-website-bucket"
index_document        = "index.html"
error_document        = "error.html"
website_files_path    = "./modules/s3-website/website/"

# Lambda function

function_name         = "reminder_lambda"
runtime               = "python3.13"
handler               = "index.handler"
architectures         = ["x86_64"]
filename              = "./modules/lambda-functions/lambda.zip"
source_code_hash      = filebase64sha256("./modules/lambda-functions/lambda.zip")

