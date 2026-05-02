locals {
  # Use a larger instance in prod, smaller in dev
  # terraform.workspace is a built-in variable that holds the
  # current workspace name (e.g. "dev" or "prod")
  instance_type = terraform.workspace == "prod" ? "t2.medium" : "t2.micro"

  # Use a larger disk in prod
  volume_size = terraform.workspace == "prod" ? 10 : 8

  # Common tags applied to every resource via the modules
  common_tags = {
    Project     = var.project_name
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
    Week        = "Week16Lab"
  }
}