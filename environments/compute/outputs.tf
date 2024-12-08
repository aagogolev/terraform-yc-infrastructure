output "instance_ids" {
  description = "IDs of created instances"
  value       = module.compute.instance_ids
}

output "instance_external_ip" {
  description = "Public IP addresses of instances"
  value       = module.compute.external_ips
}

output "instance_internal_ip" {
  description = "Private IP addresses of instances"
  value       = module.compute.internal_ips
}
