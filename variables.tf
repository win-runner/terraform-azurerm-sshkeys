variable "tls_private_key" {
  description = <<EOT
This object creates ephemeral PEM (and OpenSSH) formatted private keys.

`algorithm` = Name of the algorithm to use when generating the private key. Currently-supported values are: RSA and ED25519.

`rsa_bits` = When algorithm is RSA, the size of the generated RSA key, in bits.
EOT

  type = object({
    algorithm = optional(string, "RSA")
    rsa_bits  = optional(number, 4096)
  })
  default  = {}
  nullable = false

  validation {
    condition     = contains(["RSA", "ED25519"], var.tls_private_key.algorithm)
    error_message = <<EOT
Currently-supported `tls_private_key.algorithm` values are: RSA and ED25519.
The algorithm `ECDSA` is not supported, because it is not recommended for SSH keys.
EOT
  }
}

variable "key_vault_id" {
  description = "The ID of the Key Vault where the Secret should be created. Changing this forces a new resource to be created."
  type        = string
}

variable "secret_name" {
  description = "Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created."
  type        = string
}

variable "expiration_date" {
  description = "Expiration UTC datetime (Y-m-d'T'H:M:S'Z')"
  type        = string
  default     = null
}
