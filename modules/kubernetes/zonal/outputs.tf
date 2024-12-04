output "cluster_id" {
  value       = yandex_kubernetes_cluster.zonal_cluster.id
  description = "ID кластера Kubernetes"
}

output "cluster_name" {
  value       = yandex_kubernetes_cluster.zonal_cluster.name
  description = "Имя кластера Kubernetes"
}

output "external_v4_endpoint" {
  value       = yandex_kubernetes_cluster.zonal_cluster.master[0].external_v4_endpoint
  description = "Внешний endpoint кластера"
}

output "cluster_ca_certificate" {
  value       = yandex_kubernetes_cluster.zonal_cluster.master[0].cluster_ca_certificate
  description = "CA сертификат кластера"
  sensitive   = true
}

output "cluster_sa_id" {
  value       = yandex_iam_service_account.cluster_sa.id
  description = "ID сервисного аккаунта кластера"
}

output "node_sa_id" {
  value       = yandex_iam_service_account.node_sa.id
  description = "ID сервисного аккаунта узлов"
}
