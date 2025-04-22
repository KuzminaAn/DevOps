output "bucket_url" {
  value = "https://${yandex_storage_bucket.bucket.bucket}.storage.yandexcloud.net/${yandex_storage_object.image.key}"
}

output "network_lb_ip" {
  value = yandex_lb_network_load_balancer.network_lb.listener[*].external_address_spec[*].address
}