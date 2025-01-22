variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "ami"{
    description = "ami name in aws"
    type        = string
}

variable "instance_type"{
    description = "instance type"
    type = string
}

variable "instance_count"{
    description = "count of instance"
    type = number
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}
