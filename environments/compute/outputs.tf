output "bastion_public_ip" {
  description = "Bastion host public IP"
  value       = module.bastion.external_ips[0]
}

output "private_instances_ips" {
  description = "Private instances internal IPs"
  value       = module.private_instances.internal_ips
}

