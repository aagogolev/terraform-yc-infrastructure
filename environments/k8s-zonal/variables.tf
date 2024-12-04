variable "folder_id" {
  type        = string
  description = "ID каталога в Yandex Cloud"
}

variable "network_id" {
  type        = string
  description = "ID сети"
}

variable "subnet_id" {
  type        = string
  description = "ID подсети"
}

variable "token" {
  type        = string
  description = "OAuth-токен Yandex Cloud"
}

variable "cloud_id" {
  type        = string
  description = "ID облака в Yandex Cloud"
}

variable "zone" {
  type        = string
  description = "Зона доступности"
  default     = "ru-central1-a"
}

variable "ssh_key" {
  type        = string
  description = "SSH публичный ключ"
}


