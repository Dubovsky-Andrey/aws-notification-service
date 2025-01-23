environment           = "prod"
project               = "project-name"
aws_region            = "us-east-1"
role_name             = "LambdaRole"
role_path             = "/"
assume_role_services  = ["lambda.amazonaws.com"]
enable_cloudwatchlogs = true
enable_sns_and_ses    = true