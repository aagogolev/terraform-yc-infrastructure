module "network" {
  source = "../../modules/network"

  network_name = "dev-network"
  folder_id    = var.folder_id
  subnets = [
    {
      zone = "ru-central1-a"
      cidr = "10.0.1.0/24"
    },
  ]
}
