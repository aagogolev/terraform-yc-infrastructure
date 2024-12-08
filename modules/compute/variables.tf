variable "instances" {
  description = "Список виртуальных машин для создания"
  type = map(object({
    name          = string
    zone          = string
    image_id      = string
    cores         = number
    memory        = number
    disk_size     = number
    nat           = optional(bool, false)
    preemptible   = optional(bool, false)
    description   = optional(string, "")
    platform_id   = optional(string, "standard-v1")
    core_fraction = optional(number, 100)
    disk_type     = optional(string, "network-ssd")
    labels        = optional(map(string), {})
    additional_disks = optional(list(object({
      size = number
      type = string
    })), [])
    network_interfaces = list(object({
      subnet_id = string
      nat       = optional(bool, false)
    }))
    service_account_id = optional(string, null)
    placement_group_id = optional(string, null)
  }))
}

variable "ssh_username" {
  description = "Имя пользователя для SSH-доступа"
  type        = string
  default     = "yc-user"
}

variable "ssh_key_path" {
  description = "Путь к публичному SSH ключу"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
