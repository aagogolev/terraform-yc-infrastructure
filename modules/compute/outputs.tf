output "instance_ids" {
  description = "IDs of created instances"
  value       = yandex_compute_instance.vm[*].id
}

output "external_ips" {
  description = "Public IP addresses of instances"
  value       = yandex_compute_instance.vm[*].network_interface[0].nat_ip_address
}

output "internal_ips" {
  description = "Private IP addresses of instances"
  value       = yandex_compute_instance.vm[*].network_interface[0].ip_address
}
