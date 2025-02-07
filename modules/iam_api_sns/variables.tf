/*
Variables for IAM module.
*/
variable "project_name" {
  description = "The project name"
  type        = string
}

variable "environment" {
  description = "The environment (e.g. dev, prod)"
  type        = string
}
