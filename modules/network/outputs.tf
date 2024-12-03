output "network_id" {
  description = "The ID of the VPC"
  value       = yandex_vpc_network.this.id
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = yandex_vpc_subnet.this[*].id
}
