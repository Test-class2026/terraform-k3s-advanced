output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.k3s_server.public_ip
}

output "instance_id" {
  description = "The EC2 instance ID"
  value       = aws_instance.k3s_server.id
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = aws_instance.k3s_server.private_ip
}