environment    = "prod"
project        = "project-name"
role_name = "LambdaRole"
role_path  = "/"
assume_role_services  = ["lambda.amazonaws.com"]
enable_cloudwatchlogs = true
enable_sns_and_ses    = true