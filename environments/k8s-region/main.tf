module "kubernetes_cluster" {
  source = "../../modules/kubernetes/regional"

  folder_id    = var.folder_id
  cluster_name = "production-regional"
  network_id   = var.network_id

  # Указываем подсети для всех зон доступности
  subnet_ids = {
    "ru-central1-a" = var.subnet_a_id
    "ru-central1-b" = var.subnet_b_id
    "ru-central1-d" = var.subnet_d_id
  }

  # Настраиваем расположение мастер-нод в трех зонах
  master_locations = [
    {
      zone      = "ru-central1-a"
      subnet_id = var.subnet_a_id
    },
    {
      zone      = "ru-central1-b"
      subnet_id = var.subnet_b_id
    },
    {
      zone      = "ru-central1-d"
      subnet_id = var.subnet_d_id
    }
  ]

  # Настраиваем обновления кластера
  auto_upgrade = false
  maintenance_window = {
    day        = "saturday"
    start_time = "23:00"
    duration   = "3h"
  }

  # Указываем SSH-ключ для доступа к узлам
  ssh_username = "admin"
  ssh_key      = file(var.ssh_key_path)

  # Настраиваем группы узлов
  node_groups = {
    "fixed_group" = {
      name        = "fixed"
      description = "Fixed size node group"
      zones       = ["ru-central1-a", "ru-central1-b"]
      memory      = 8
      cores       = 4
      disk_type   = "network-ssd"
      disk_size   = 93
      scale_policy = {
        fixed = {
          size = 3
        }
      }
    }

    "auto_group" = {
      name        = "auto"
      description = "Auto scalable node group"
      zones       = ["ru-central1-a"] # Только одна зона для автомасштабирования
      memory      = 16
      cores       = 8
      disk_type   = "network-ssd"
      disk_size   = 93
      scale_policy = {
        auto = {
          min     = 1
          max     = 3
          initial = 1
        }
      }
    }
  }
}
