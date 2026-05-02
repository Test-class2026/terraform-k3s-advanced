# These reference the compute module outputs
output "server_public_ip" {
  description = "Public IP address of the server"
  value       = module.compute.public_ip
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = module.compute.instance_id
}

output "ssh_command" {
  description = "SSH command to connect to the server"
  value = "ssh -i $env:USERPROFILE/.ssh/devops-key.pem ubuntu@${module.compute.public_ip}"
}

output "app_url" {
  description = "URL to access K3s NodePort apps"
  value       = "http://${module.compute.public_ip}:30080"
}

# These reference the networking module outputs
output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "environment" {
  description = "Current workspace / environment"
  value       = terraform.workspace
}