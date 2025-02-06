/*
Variables for API Gateway module.
*/
variable "project_name" {
  description = "The project name"
  type        = string
}

variable "environment" {
  description = "The environment (e.g. dev, prod)"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "email_topic_arn" {
  description = "ARN of the SNS Email Topic"
  type        = string
}

variable "sms_topic_arn" {
  description = "ARN of the SNS SMS Topic"
  type        = string
}

variable "push_topic_arn" {
  description = "ARN of the SNS Push Topic"
  type        = string
}
