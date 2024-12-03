resource "yandex_vpc_network" "this" {
  name        = var.network_name
  description = "Main network"
  folder_id   = var.folder_id
}

resource "yandex_vpc_subnet" "this" {
  count          = length(var.subnets)
  name           = "${var.network_name}-${var.subnets[count.index].zone}"
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = [var.subnets[count.index].cidr]
  zone           = var.subnets[count.index].zone
}
