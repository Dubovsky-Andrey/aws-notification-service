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
