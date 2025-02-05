/*
Variables for Lambda Email module.
*/
variable "project_name" {
  description = "The project name"
  type        = string
}

variable "environment" {
  description = "The environment (e.g. dev, prod)"
  type        = string
}

variable "iam_role_arn" {
  description = "The ARN of the IAM role for Lambda"
  type        = string
}
