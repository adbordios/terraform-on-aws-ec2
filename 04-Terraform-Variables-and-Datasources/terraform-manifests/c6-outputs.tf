# Terraform Output Values

# EC2 Instance Public IP
output "instance_public_ip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.my_ec2_instance.public_ip
}

# EC2 Instance Public DNS
output "instance_public_dns" {
  description = "EC2 Instance Public DNS"
  value       = aws_instance.my_ec2_instance.public_dns
}