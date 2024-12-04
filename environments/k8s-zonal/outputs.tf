output "cluster_id" {
  value = module.kubernetes_cluster.cluster_id
}

output "external_v4_endpoint" {
  value = module.kubernetes_cluster.external_v4_endpoint
}
