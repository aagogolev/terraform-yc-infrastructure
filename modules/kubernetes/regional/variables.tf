variable "folder_id" {
  type        = string
  description = "ID каталога в Yandex Cloud"
}

variable "cluster_name" {
  type        = string
  description = "Имя кластера Kubernetes"
}

variable "cluster_description" {
  type        = string
  description = "Описание кластера"
  default     = "Regional Kubernetes cluster"
}

variable "network_id" {
  type        = string
  description = "ID сети"
}

variable "subnet_ids" {
  type        = map(string)
  description = "Map зон доступности и ID подсетей"
}

variable "k8s_version" {
  type        = string
  description = "Версия Kubernetes"
  default     = "1.27"
}

variable "master_locations" {
  type = list(object({
    zone      = string
    subnet_id = string
  }))
  description = "Список зон и подсетей для мастер-нод"
}

variable "master_public_ip" {
  type        = bool
  description = "Публичный IP для master-узла"
  default     = true
}

variable "auto_upgrade" {
  type        = bool
  description = "Автоматическое обновление мастера"
  default     = true
}

variable "maintenance_window" {
  description = "Окно обслуживания кластера"
  type = object({
    day        = optional(string)
    start_time = optional(string)
    duration   = optional(string)
  })
  default = null
}

variable "release_channel" {
  type        = string
  description = "Канал обновлений"
  default     = "REGULAR"
}

variable "network_policy_provider" {
  type        = string
  description = "Провайдер сетевых политик"
  default     = "CALICO"
}

variable "ssh_key" {
  type        = string
  description = "SSH публичный ключ"
}

variable "ssh_username" {
  type        = string
  description = "Имя пользователя для SSH доступа"
  default     = "ubuntu"
}

variable "node_groups" {
  description = "Параметры групп узлов"
  type = map(object({
    name        = string
    description = optional(string, "Node group for regional cluster")
    platform_id = optional(string, "standard-v2")
    memory      = optional(number, 8)
    cores       = optional(number, 4)
    disk_type   = optional(string, "network-hdd")
    disk_size   = optional(number, 64)
    nat         = optional(bool, true)
    zones       = list(string)
    scale_policy = object({
      fixed = optional(object({
        size = number
      }))
      auto = optional(object({
        min     = number
        max     = number
        initial = number
      }))
    })
  }))
}
