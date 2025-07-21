locals {
  vm_names = [
    "workload-011",
    "workload-022",
    "workload-033"
  ]
  ssh_expiration_date = "2025-12-01T00:00:00Z"
}

data "azurerm_key_vault" "main" {
  name                = "kv-iacws-tf-01-demo-2303"
  resource_group_name = "rg-iacws-tf-01-demo"
}

module "ssh_key" {
  source = "../.."

  for_each = toset(local.vm_names)

  key_vault_id    = data.azurerm_key_vault.main.id
  secret_name     = each.key
  expiration_date = local.ssh_expiration_date
}
