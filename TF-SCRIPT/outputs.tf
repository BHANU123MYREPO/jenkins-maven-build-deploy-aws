output "module_instance_ids" {
  description = "List of EC2 instance IDs from the module"
  value       = module.ec2_instances.instance_ids
}

output "module_public_ip_addresses" {
  description = "List of public IP addresses associated with EC2 instances from the module"
  value       = module.ec2_instances.public_ip_addresses
}