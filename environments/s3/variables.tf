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
