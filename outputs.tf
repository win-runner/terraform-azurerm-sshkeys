output "public_key_secret_id" {
  description = "The resource ID of the ssh public keys."
  value       = azurerm_key_vault_secret.public_key.id
}

output "private_key_secret_id" {
  description = "The resource ID of the ssh private keys."
  value       = azurerm_key_vault_secret.private_key.id
}
