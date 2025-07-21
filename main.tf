ephemeral "tls_private_key" "this" {
  algorithm = var.tls_private_key.algorithm
  rsa_bits  = var.tls_private_key.rsa_bits
}

resource "azurerm_key_vault_secret" "private_key" {
  key_vault_id     = var.key_vault_id
  name             = "${var.secret_name}-private"
  value_wo         = ephemeral.tls_private_key.this.private_key_pem
  value_wo_version = 1
  content_type     = "ssh-private"
  expiration_date  = var.expiration_date
}

resource "azurerm_key_vault_secret" "public_key" {
  key_vault_id     = var.key_vault_id
  name             = "${var.secret_name}-public"
  value_wo         = ephemeral.tls_private_key.this.public_key_openssh
  value_wo_version = 1
  content_type     = "ssh-public"
  expiration_date  = var.expiration_date
}
