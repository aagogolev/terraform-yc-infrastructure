resource "yandex_compute_disk" "additional_disk" {
  for_each = {
    for pair in flatten([
      for vm_key, vm in var.instances : [
        for disk_index, disk in vm.additional_disks : {
          key = "${vm_key}-${disk_index}"
          value = merge(disk, {
            vm_name = vm.name
            zone    = vm.zone
          })
        }
      ]
    ]) : pair.key => pair.value
  }

  name = "${each.value.vm_name}-additional-disk-${each.key}"
  type = each.value.type
  zone = each.value.zone
  size = each.value.size
}

resource "yandex_compute_instance" "vm" {
  for_each = var.instances

  name        = each.value.name
  description = each.value.description
  platform_id = each.value.platform_id
  zone        = each.value.zone

  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = each.value.image_id
      size     = each.value.disk_size
      type     = each.value.disk_type
    }
  }

  dynamic "secondary_disk" {
    for_each = each.value.additional_disks != null ? each.value.additional_disks : []
    content {
      disk_id     = yandex_compute_disk.additional_disk["${each.key}-${secondary_disk.key}"].id
      auto_delete = true
    }
  }

  dynamic "network_interface" {
    for_each = each.value.network_interfaces
    content {
      subnet_id = network_interface.value.subnet_id
      nat       = network_interface.value.nat
    }
  }

  metadata = {
    user-data = templatefile("${path.module}/cloud_config.yaml", {
      ssh_username = var.ssh_username
      ssh_key      = file(var.ssh_key_path)
    })
  }

  labels = each.value.labels

  scheduling_policy {
    preemptible = each.value.preemptible
  }

  service_account_id = each.value.service_account_id

  dynamic "placement_policy" {
    for_each = each.value.placement_group_id != null ? [1] : []
    content {
      placement_group_id = each.value.placement_group_id
    }
  }
}
