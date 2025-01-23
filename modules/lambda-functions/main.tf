esource "aws_lambda_function" "my_function" {
  function_name = "myFunctionName"
  runtime       = "nodejs16.x" 
  handler       = "index.handler"
  role          = aws_iam_role.lambda_execution_role.arn
  architectures = ["x86_64"]
  filename         = "path/to/your/lambda.zip"
  source_code_hash = filebase64sha256("path/to/your/lambda.zip")

  environment {
    variables = {
      ENV_VAR = "value"
    }
  }

  tags = {
    Environment = "prod"
    Project     = "MyProject"
  }
}