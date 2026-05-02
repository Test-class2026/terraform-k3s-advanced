# Prod environment — larger instance, more storage
project_name  = "terraform-k3s"
environment   = "prod"
aws_region    = "us-east-1"
key_pair_name = "devops-key"
vpc_cidr      = "10.1.0.0/16"
subnet_cidr   = "10.1.1.0/24"
install_k3s   = true