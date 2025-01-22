terraform {
  backend "s3" {
    bucket         = "dubovsky-andrey-terraform-stage-bucket"
    key            = "aws-notification-service/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile   = true
    encrypt        = true
  }
}
