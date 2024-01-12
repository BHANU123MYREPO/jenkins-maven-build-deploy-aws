# modules/ec2-module/outputs.tf

output "instance_ids" {
  description = "IDs of the created EC2 instances"
  value       = aws_instance.ec2_instances[*].id
}

output "public_ip_addresses" {
  description = "List of public IP addresses associated with EC2 instances"
  value       = aws_instance.ec2_instances[*].public_ip
}
