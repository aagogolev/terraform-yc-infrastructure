variable "folder_id" {
  type        = string
  description = "Yandex Cloud Folder ID"
}

variable "cloud_id" {
  type        = string
  description = "Yandex Cloud ID"
}

variable "zone" {
  type        = string
  description = "Yandex Cloud Zone"
  default     = "ru-central1-a"
}

variable "token" {
  type        = string
  description = "Yandex Cloud API token"
  sensitive   = true
}
