provider "vault" {
 address = "http://127.0.0.1:8200"
 skip_tls_verify = true
 token = var.token
}

resource "vault_generic_secret" "my_example_secret" {
  path = "secret/my_example"

  data_json = jsonencode({
    data_key   = var.data_key
    data_value = var.data_value
  })
}

output "secret_path" {
  value       = vault_generic_secret.my_example_secret.path
}

output "secret_data" {
  value       = vault_generic_secret.my_example_secret.data
  sensitive   = true
}
