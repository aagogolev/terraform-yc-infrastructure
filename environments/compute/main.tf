data "terraform_remote_state" "network" {
  backend = "local"
  config = {
    path = "../network/terraform.tfstate"
  }
}

module "bastion" {
  source = "../../modules/compute"

  name_prefix         = "bastion"
  instance_count     = 1
  zone              = var.zone
  subnet_id         = data.terraform_remote_state.network.outputs.subnet_ids[0]
  image_id          = var.image_id
  ssh_user          = var.ssh_user
  ssh_public_key_path = var.ssh_public_key_path
  nat               = true

  resources = {
    cores         = 2
    memory        = 4
    core_fraction = 20
  }
}

module "private_instances" {
  source = "../../modules/compute"

  name_prefix         = "private"
  instance_count     = 3
  zone              = var.zone
  subnet_id         = data.terraform_remote_state.network.outputs.subnet_ids[0]
  image_id          = var.image_id
  ssh_user          = var.ssh_user
  ssh_public_key_path = var.ssh_public_key_path
  nat               = false

  resources = {
    cores         = 2
    memory        = 4
    core_fraction = 100
  }
}
