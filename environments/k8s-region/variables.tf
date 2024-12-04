variable "cloud_id" {
  type        = string
  description = "ID облака в Yandex Cloud"
}

variable "folder_id" {
  type        = string
  description = "ID каталога в Yandex Cloud"
}

variable "token" {
  type        = string
  description = "OAuth-токен Yandex Cloud"
  sensitive   = true
}

variable "network_id" {
  type        = string
  description = "ID сети"
}

variable "subnet_a_id" {
  type        = string
  description = "ID подсети в зоне ru-central1-a"
}

variable "subnet_b_id" {
  type        = string
  description = "ID подсети в зоне ru-central1-b"
}

variable "subnet_d_id" {
  type        = string
  description = "ID подсети в зоне ru-central1-d"
}

variable "ssh_key_path" {
  type        = string
  description = "Путь к публичному SSH ключу"
  default     = "~/.ssh/id_rsa.pub"
}
