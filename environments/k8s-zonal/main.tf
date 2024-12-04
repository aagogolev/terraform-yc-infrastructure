module "kubernetes_cluster" {
  source = "../../modules/kubernetes/zonal"

  folder_id    = var.folder_id
  cluster_name = "dev-cluster"
  network_id   = var.network_id
  subnet_id    = var.subnet_id
  zone         = var.zone

  auto_upgrade = true
  
  ssh_username = "admin"
  ssh_key      = file(var.ssh_key)

  node_groups = {
    fixed = {
      name        = "fixed-group"
      memory      = 8
      cores       = 4
      scale_policy = {
        fixed = {
          size = 3
        }
      }
    }
    auto = {
      name        = "auto-group"
      memory      = 16
      cores       = 8
      scale_policy = {
        auto = {
          min     = 1
          max     = 4
          initial = 2
        }
      }
    }
  }
}
