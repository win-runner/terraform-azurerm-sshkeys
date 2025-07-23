# Module call
# ---
data "azurerm_key_vault" "main" {
  name                = "kvName"
  resource_group_name = "rgName"
}

module "ssh_key" {
  source = "../.."

  key_vault_id    = data.azurerm_key_vault.main.id
  secret_name     = "vm-linux-001"
  expiration_date = "2025-12-01T00:00:00Z"
}

# Virtual Machine deployment
# ---
data "azurerm_key_vault_secret" "ssh_public" {
  name         = "vm-linux-001-public"
  key_vault_id = data.azurerm_key_vault.main.id

  depends_on = [module.ssh_key]
}

data "azurerm_subnet" "main" {
  name                 = "snetName"
  virtual_network_name = "vnetName"
  resource_group_name  = "rgName"
}

resource "azurerm_resource_group" "main" {
  name     = "rgName"
  location = var.location

  tags = var.tags
}

resource "azurerm_public_ip" "main" {
  name                = "pipName"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags
}

resource "azurerm_network_interface" "main" {
  name                = "nicName"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                = "vmName"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B1ls"
  admin_username      = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.main.id
  ]

  os_disk {
    name                 = "osdiskName"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "azureuser"
    public_key = data.azurerm_key_vault_secret.ssh_public.value
  }

  disable_password_authentication = true

  tags = var.tags
}
