/*
Variables for SNS module.
*/
variable "project_name" {
  description = "The project name"
  type        = string
}

variable "environment" {
  description = "The environment (e.g. dev, prod)"
  type        = string
}

variable "lambda_email_arn" {
  description = "ARN of the Email Lambda function"
  type        = string
}

variable "lambda_sms_arn" {
  description = "ARN of the SMS Lambda function"
  type        = string
}

variable "lambda_push_arn" {
  description = "ARN of the Push Lambda function"
  type        = string
}
