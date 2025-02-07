/*
This module creates an IAM role for ApiGateway and SNS with basic execution permissions.
*/

resource "aws_iam_role" "apigateway_sns_role" {
  name = "${var.project_name}-${var.environment}-apigateway-sns-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "apigateway.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}