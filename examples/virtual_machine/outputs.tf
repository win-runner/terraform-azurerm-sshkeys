output "public_keys" {
  value = { for name, mod in module.ssh_key : name => mod.public_key_secret_id }
}

output "private_key_secret_ids" {
  value = { for name, mod in module.ssh_key : name => mod.private_key_secret_id }
}
