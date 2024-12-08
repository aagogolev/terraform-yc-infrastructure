data "terraform_remote_state" "network" {
  backend = "local"
  config = {
    path = "../network/terraform.tfstate"
  }
}

module "compute" {
  source = "../../modules/compute"

  instances = {
    "vm1" = {
      name      = "test-vm-1"
      zone      = "ru-central1-a"
      image_id  = var.image_id
      cores     = 2
      memory    = 4
      disk_size = 20
      labels = {
        environment = "test"
      }

      additional_disks = [
        {
          size = 50
          type = "network-ssd"
        },
        {
          size = 50
          type = "network-ssd"
        },
      ]

      network_interfaces = [
        {
          subnet_id = data.terraform_remote_state.network.outputs.subnet_ids[0]
          nat       = true
        },
        {
          subnet_id = "e9behbibg41b15usc96c"
          nat       = false
        }
      ]
    }
  }

  ssh_username = var.ssh_user
  ssh_key_path = var.ssh_public_key_path
}
