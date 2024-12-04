output "cluster_id" {
  value = module.kubernetes_cluster.cluster_id
}

output "cluster_name" {
  value = module.kubernetes_cluster.cluster_name
}

output "cluster_status" {
  value = module.kubernetes_cluster.cluster_status
}

output "cluster_endpoint" {
  value = module.kubernetes_cluster.cluster_endpoint
}

output "cluster_ca_certificate" {
  value = module.kubernetes_cluster.cluster_ca_certificate
}
