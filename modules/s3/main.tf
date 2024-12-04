resource "yandex_iam_service_account" "sa" {
  name        = "${var.bucket_name}-sa"
  description = "Service account for S3 bucket ${var.bucket_name}"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-roles" {
  for_each = toset([
    "storage.editor",
    "storage.admin"
  ])

  folder_id = var.folder_id
  role      = each.value
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
}

resource "yandex_storage_bucket" "bucket" {
  bucket     = var.bucket_name
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key

  max_size              = var.max_size != 0 ? var.max_size : null
  default_storage_class = var.default_storage_class
  force_destroy         = var.force_destroy

  versioning {
    enabled = var.versioning
  }
}

