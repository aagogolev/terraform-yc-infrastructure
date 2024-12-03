variable "network_name" {
  type        = string
  description = "Name of the network"
}

variable "folder_id" {
  type        = string
  description = "Yandex Cloud Folder ID"
}

variable "subnets" {
  type = list(object({
    zone = string
    cidr = string
  }))
  description = "Subnets configuration"
}
