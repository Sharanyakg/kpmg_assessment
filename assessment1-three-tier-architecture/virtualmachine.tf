resource "azurerm_virtual_network" "webservervnet" {
  name                = "webserver-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.testrg.location
  resource_group_name = azurerm_resource_group.testrg.name
}

resource "azurerm_subnet" "webserver" {
  name                 = "testsubnet"
  resource_group_name  = azurerm_resource_group.testrg.name
  virtual_network_name = azurerm_virtual_network.testrg.name
  address_prefixes     = ["10.0.2.0/24"]
}

data "azurerm_key_vault_secret" "credentials" {
  name         = "password"
  key_vault_id = "/subscriptions/xxxxx/resourceGroups/yyyyy/providers/Microsoft.KeyVault/vaults/zzzzz"
}
resource "azurerm_network_interface" "test_nic" {
  name                = "test-nic"
  location            = azurerm_resource_group.testrg.location
  resource_group_name = azurerm_resource_group.testrg.name

  ip_configuration {
    name                          = "testip"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "webservervm" {
  name                = "test-vm"
  resource_group_name = azurerm_resource_group.testrg.name
  location            = azurerm_resource_group.testrg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = data.azurerm_key_vault_secret.credentials.value
  availability_set_id = azurerm_availability_set.web_availabilty_set.id
  network_interface_ids = [
    azurerm_network_interface.test_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
