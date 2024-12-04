output "bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "bucket_domain_name" {
  value = module.s3_bucket.bucket_domain_name
}

output "access_key" {
  value = module.s3_bucket.access_key
}

output "secret_key" {
  value     = module.s3_bucket.secret_key
  sensitive = true
}
