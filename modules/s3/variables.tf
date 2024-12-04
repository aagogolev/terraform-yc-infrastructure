variable "bucket_name" {
  type        = string
  description = "Имя бакета"
}

variable "folder_id" {
  type        = string
  description = "ID каталога"
}

variable "max_size" {
  type        = number
  description = "Максимальный размер бакета в байтах. Если 0 - без ограничений"
  default     = 0
}
variable "default_storage_class" {
  type        = string
  description = "Класс хранения по умолчанию"
  default     = "STANDARD"
}

variable "force_destroy" {
  type        = bool
  description = "Удалять объекты при удалении бакета"
  default     = false
}

variable "versioning" {
  type        = bool
  description = "Включить версионирование"
  default     = false
}
