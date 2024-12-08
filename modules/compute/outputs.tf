output "instance_ids" {
  description = "IDs of created instances"
  value       = values(yandex_compute_instance.vm)[*].id
}

output "external_ips" {
  description = "External IP addresses of created instances"
  value       = [for vm in yandex_compute_instance.vm : vm.network_interface[0].nat_ip_address if vm.network_interface[0].nat]
}

output "internal_ips" {
  description = "Internal IP addresses of created instances"
  value       = [for vm in yandex_compute_instance.vm : vm.network_interface[0].ip_address]
}
