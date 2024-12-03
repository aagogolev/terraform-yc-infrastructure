resource "yandex_compute_instance" "vm" {
  count       = var.instance_count
  name        = "${var.name_prefix}-${count.index + 1}"
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores  = var.resources.cores
    memory = var.resources.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.boot_disk_size
      type     = var.boot_disk_type
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.nat
  }

  metadata = {
    user-data = <<-EOF
    #cloud-config
    users:
      - name: ${var.ssh_user}
        sudo: ALL=(ALL) NOPASSWD:ALL
        shell: /bin/bash
        ssh_authorized_keys:
          - ${file(var.ssh_public_key_path)}
    EOF
  }
}
