module "ec2-count" {
  source          = "./modules/ec2-count"
  environment     = var.environment
  project         = var.project
  ami             = var.ami
  instance_type   = var.instance_type
  instance_count  = var.instance_count
}