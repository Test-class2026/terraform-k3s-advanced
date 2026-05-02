# Dev environment — small, cheap, safe to experiment with
project_name  = "terraform-k3s"
environment   = "dev"
aws_region    = "us-east-1"
key_pair_name = "devops-key"
vpc_cidr      = "10.0.0.0/16"
subnet_cidr   = "10.0.1.0/24"
install_k3s   = true