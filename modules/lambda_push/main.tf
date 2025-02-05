/*
This module deploys a Lambda function for sending Push notifications.
*/

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "${path.module}/lambda_push.zip"
}

resource "aws_lambda_function" "push_lambda" {
  function_name    = "${var.project_name}-${var.environment}-push"
  runtime          = "python3.8"
  handler          = "lambda_function.lambda_handler"
  role             = var.iam_role_arn
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = {
      CHANNEL = "PUSH"
    }
  }
}
