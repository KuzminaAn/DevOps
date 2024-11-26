provider "vault" {
 address = "http://127.0.0.1:8200"
 skip_tls_verify = true
 token = var.token
}
data "vault_generic_secret" "vault_example"{
 path = "secret/example"
}

output "vault_example" {
 value = "${nonsensitive(data.vault_generic_secret.vault_example.data)}"
} 
