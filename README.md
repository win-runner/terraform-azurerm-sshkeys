<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.11 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.0, < 5.0.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.1, < 5.0.0 |

## Usage

Basic usage of this module is as follows:

```hcl
  module "example" {
    	 source  = "git::https://<org>@dev.azure.com/<org>/<project>/_git/<module>?ref=<version>"

	 # Required variables
    	 key_vault_id  =
    	 secret_name  =

	 # Optional variables
    	 expiration_date  = null
    	 tls_private_key  = {}
  }
```

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.private_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.public_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the Key Vault where the Secret should be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_expiration_date"></a> [expiration\_date](#input\_expiration\_date) | Expiration UTC datetime (Y-m-d'T'H:M:S'Z') | `string` | `null` | no |
| <a name="input_tls_private_key"></a> [tls\_private\_key](#input\_tls\_private\_key) | This object creates ephemeral PEM (and OpenSSH) formatted private keys.<br/><br/>`algorithm` = Name of the algorithm to use when generating the private key. Currently-supported values are: RSA and ED25519.<br/><br/>`rsa_bits` = When algorithm is RSA, the size of the generated RSA key, in bits. | <pre>object({<br/>    algorithm = optional(string, "RSA")<br/>    rsa_bits  = optional(number, 4096)<br/>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_key_secret_id"></a> [private\_key\_secret\_id](#output\_private\_key\_secret\_id) | The resource ID of the ssh private keys. |
| <a name="output_public_key_secret_id"></a> [public\_key\_secret\_id](#output\_public\_key\_secret\_id) | The resource ID of the ssh public keys. |
<!-- END_TF_DOCS -->
