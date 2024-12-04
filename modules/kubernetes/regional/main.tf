# Сервисный аккаунт для кластера
resource "yandex_iam_service_account" "cluster_sa" {
  name        = "${var.cluster_name}-cluster-sa"
  description = "Service account for cluster management"
}

# Роли для сервисного аккаунта кластера
resource "yandex_resourcemanager_folder_iam_member" "cluster_roles" {
  for_each = toset([
    "k8s.clusters.agent",
    "editor"
  ])

  folder_id = var.folder_id
  role      = each.value
  member    = "serviceAccount:${yandex_iam_service_account.cluster_sa.id}"
}

# Сервисный аккаунт для узлов
resource "yandex_iam_service_account" "node_sa" {
  name        = "${var.cluster_name}-node-sa"
  description = "Service account for cluster nodes"
}

# Роли для сервисного аккаунта узлов
resource "yandex_resourcemanager_folder_iam_member" "node_roles" {
  for_each = toset([
    "container-registry.images.puller",
    "vpc.publicAdmin",
    "load-balancer.admin"
  ])

  folder_id = var.folder_id
  role      = each.value
  member    = "serviceAccount:${yandex_iam_service_account.node_sa.id}"
}

resource "yandex_kubernetes_cluster" "regional_cluster" {
  name        = var.cluster_name
  description = var.cluster_description
  network_id  = var.network_id

  master {
    version = var.k8s_version
    regional {
      region = "ru-central1"
      dynamic "location" {
        for_each = var.master_locations
        content {
          zone      = location.value.zone
          subnet_id = location.value.subnet_id
        }
      }
    }

    public_ip = var.master_public_ip

    maintenance_policy {
      auto_upgrade = var.auto_upgrade

      dynamic "maintenance_window" {
        for_each = var.maintenance_window != null ? [var.maintenance_window] : []
        content {
          day        = maintenance_window.value.day
          start_time = maintenance_window.value.start_time
          duration   = maintenance_window.value.duration
        }
      }
    }
  }

  service_account_id      = yandex_iam_service_account.cluster_sa.id
  node_service_account_id = yandex_iam_service_account.node_sa.id

  release_channel         = var.release_channel
  network_policy_provider = var.network_policy_provider
}

resource "yandex_kubernetes_node_group" "node_groups" {
  for_each = var.node_groups

  cluster_id  = yandex_kubernetes_cluster.regional_cluster.id
  name        = each.value.name
  description = each.value.description
  version     = var.k8s_version

  instance_template {
    platform_id = each.value.platform_id

    metadata = {
      ssh-keys = "${var.ssh_username}:${var.ssh_key}"
    }

    network_interface {
      nat        = each.value.nat
      subnet_ids = [for zone in each.value.zones : var.subnet_ids[zone]]
    }

    resources {
      memory = each.value.memory
      cores  = each.value.cores
    }

    boot_disk {
      type = each.value.disk_type
      size = each.value.disk_size
    }
  }

  scale_policy {
    dynamic "fixed_scale" {
      for_each = each.value.scale_policy.fixed != null ? [each.value.scale_policy.fixed] : []
      content {
        size = fixed_scale.value.size
      }
    }

    dynamic "auto_scale" {
      for_each = each.value.scale_policy.auto != null ? [each.value.scale_policy.auto] : []
      content {
        min     = auto_scale.value.min
        max     = auto_scale.value.max
        initial = auto_scale.value.initial
      }
    }
  }

  allocation_policy {
    dynamic "location" {
      for_each = each.value.zones
      content {
        zone = location.value
      }
    }
  }
}
