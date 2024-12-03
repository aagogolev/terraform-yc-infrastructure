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

variable "image_id" {
  type        = string
  description = "Boot disk image ID"
}

variable "ssh_user" {
  type        = string
  description = "SSH user for instance access"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to SSH public key file"
}
