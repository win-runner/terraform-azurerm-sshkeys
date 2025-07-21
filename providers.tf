terraform {
  required_version = "~> 1.11"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0, < 5.0.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.1, < 5.0.0"
    }
  }
}
