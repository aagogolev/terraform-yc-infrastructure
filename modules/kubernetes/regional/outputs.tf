output "cluster_id" {
  description = "ID кластера Kubernetes"
  value       = yandex_kubernetes_cluster.regional_cluster.id
}

output "cluster_name" {
  description = "Имя кластера Kubernetes"
  value       = yandex_kubernetes_cluster.regional_cluster.name
}

output "cluster_status" {
  description = "Статус кластера Kubernetes"
  value       = yandex_kubernetes_cluster.regional_cluster.status
}

output "cluster_endpoint" {
  description = "Endpoint кластера Kubernetes"
  value       = yandex_kubernetes_cluster.regional_cluster.master[0].external_v4_endpoint
}

output "cluster_ca_certificate" {
  description = "CA сертификат кластера"
  value       = yandex_kubernetes_cluster.regional_cluster.master[0].cluster_ca_certificate
}

output "node_groups" {
  description = "Информация о группах узлов"
  value       = yandex_kubernetes_node_group.node_groups
}
