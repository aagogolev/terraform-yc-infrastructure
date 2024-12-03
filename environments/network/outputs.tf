output "network_id" {
  description = "ID of created network"
  value       = module.network.network_id
}

output "subnet_ids" {
  description = "IDs of created subnets"
  value       = module.network.subnet_ids
}