resource "aws_iam_role" "this" {
  name = var.role_name
  path = var.role_path

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
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "sns_and_ses" {
  count  = var.enable_sns_and_ses ? 1 : 0
  name   = "sns_and_ses"
  role   = aws_iam_role.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sns:Publish",
          "ses:SendEmail"
        ]
        Resource = "*"
      }
    ]
  })
}