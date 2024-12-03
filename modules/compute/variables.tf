variable "name_prefix" {
  type        = string
  description = "Prefix for instance names"
}

variable "instance_count" {
  type        = number
  description = "Number of instances to create"
  default     = 1
}

variable "platform_id" {
  type        = string
  description = "Platform ID (standard-v1, standard-v2, standard-v3)"
  default     = "standard-v3"
}

variable "zone" {
  type        = string
  description = "Yandex Cloud Zone"
  default     = "ru-central1-a"
}

variable "resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  description = "Computing resources configuration"
  default = {
    cores         = 2
    memory        = 4
    core_fraction = 100
  }
}

variable "image_id" {
  type        = string
  description = "Boot disk image ID"
}

variable "boot_disk_size" {
  type        = number
  description = "Boot disk size in GB"
  default     = 20
}

variable "boot_disk_type" {
  type        = string
  description = "Boot disk type (network-hdd, network-ssd)"
  default     = "network-ssd"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for network interface"
}

variable "nat" {
  type        = bool
  description = "Provide a public address"
  default     = true
}

variable "ssh_user" {
  type        = string
  description = "SSH user for instance access"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to SSH public key file"
}
