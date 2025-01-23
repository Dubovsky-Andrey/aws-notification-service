resource "aws_iam_role" "this" {
  name = var.role_name
  path = var.role_path
  assume_role_services  = var.assume_role_services
  enable_cloudwatchlogs = var.enable_cloudwatchlogs
  enable_sns_and_ses    = var.enable_sns_and_ses

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = var.assume_role_services
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "cloudwatchlogs" {
  count  = var.enable_cloudwatchlogs ? 1 : 0
  name   = "cloudwatchlogs"
  role   = aws_iam_role.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "snsandsespermissions" {
  count  = var.enable_sns_and_ses ? 1 : 0
  name   = "snsandsespermissions"
  role   = aws_iam_role.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ses:*",
          "sns:*",
          "states:*"
        ]
        Resource = "*"
      }
    ]
  })
}
