variable "aws_region" {
  description = "AWS region"
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