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