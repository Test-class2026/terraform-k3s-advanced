# ── Provider ─────────────────────────────────────────────────
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # NOTE: We will add the backend block in Part 7.
  # Leave this section as-is for now.
  # S3 remote backend
  # This replaces the local terraform.tfstate file.
  # All team members and CI/CD pipelines share this state.
  backend "s3" {
    bucket         = "terraform-state-10alytics"
    key            = "terraform-k3s/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

# ── Networking Module ─────────────────────────────────────────
# Calls the networking module and passes in the required inputs.
# The module creates the VPC, subnet, internet gateway,
# route table, and security group.
module "networking" {
  source = "./modules/networking"

  project_name = var.project_name
  environment  = var.environment
  aws_region   = var.aws_region
  vpc_cidr     = var.vpc_cidr
  subnet_cidr  = var.subnet_cidr
}

# ── Compute Module ───────────────────────────────────────────
# Calls the compute module and passes in the required inputs.
# Notice how subnet_id and security_group_id come from the
# networking module outputs — this is how modules connect.
module "compute" {
  source = "./modules/compute"

  project_name      = var.project_name
  environment       = var.environment
  instance_type     = local.instance_type
  key_pair_name     = var.key_pair_name
  subnet_id         = module.networking.subnet_id
  security_group_id = module.networking.security_group_id
  volume_size       = local.volume_size
  install_k3s       = var.install_k3s
}