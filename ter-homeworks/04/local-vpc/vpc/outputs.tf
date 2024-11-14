output "subnet_id" {
  value       = yandex_vpc_subnet.vpc_develop.id
}

output "network_id" {
  value       = yandex_vpc_network.vpc_develop.id
}
