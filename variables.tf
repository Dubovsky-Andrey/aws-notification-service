variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "role_path" {
  description = "The path for the IAM role"
  type        = string
}

variable "assume_role_services" {
  description = "The services that can assume this role"
  type        = list(string)
}

variable "enable_cloudwatchlogs" {
  description = "Whether to enable the CloudWatch Logs policy"
  type        = bool
}

variable "enable_sns_and_ses" {
  description = "Whether to enable the SNS and SES policy"
  type        = bool
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
}

variable "bucket_name" {
  description = "bucker name for s3"
  type        = string
}

variable "index_document" {
  description = "Main page"
  type        = string

}

variable "error_document" {
  description = "Error page"
  type        = string

}

variable "website_files_path" {
  description = "Path to files"
  type        = string

}

# Lambda function

variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "runtime" {
  description = "The runtime for the Lambda function"
  type        = string
}

variable "handler" {  
  description = "The handler for the Lambda function"
  type        = string
}

variable "architectures" {
  description = "The architectures for the Lambda function"
  type        = list(string)
}

variable "filename" {
  description = "The filename for the Lambda function"
  type        = string
}

variable "source_code_hash" {
  description = "The source code hash for the Lambda function"
  type        = string
}
