module "s3_bucket" {
  source = "../../modules/s3"

  bucket_name = "my-bucket-name-${random_string.bucket_suffix.result}"
  folder_id   = var.folder_id

  max_size              = 0
  default_storage_class = "STANDARD"
  force_destroy         = true
  versioning            = true
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}
