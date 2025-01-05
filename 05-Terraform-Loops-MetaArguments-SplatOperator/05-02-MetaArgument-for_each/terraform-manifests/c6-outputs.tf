# Terraform Output Values

# EC2 Instance Public IP with TOSET
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  #value       = aws_instance.my_ec2_instance[*].public_ip
  value = [for instance in aws_instance.my_ec2_instance : instance.public_ip]
}


# EC2 Instance Public DNS with TOSET
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  #value       = aws_instance.my_ec2_instance[*].public_dns
  value = [for instance in aws_instance.my_ec2_instance : instance.public_dns]

}

# EC2 Instance Public DNS with TOMAP
output "instance_publicdns2" {
  description = "EC2 Instance Public DNS"
  #value       = aws_instance.my_ec2_instance[*].public_dns
  value = tomap({ for az, instance in aws_instance.my_ec2_instance : az => instance.public_dns })

}