variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "role_path" {
  description = "The path for the IAM role"
  type        = string
  default     = "/"
}

variable "assume_role_services" {
  description = "The services that can assume this role"
  type        = list(string)
  default     = ["lambda.amazonaws.com"]
}

variable "enable_cloudwatchlogs" {
  description = "Whether to enable the CloudWatch Logs policy"
  type        = bool
  default     = true
}

variable "enable_sns_and_ses" {
  description = "Whether to enable the SNS and SES policy"
  type        = bool
  default     = true
}
