resource "azurerm_availability_set" "webserver" {
  name                = var.availability_set_name
  location            = azurerm_resource_group.testrg.location
  resource_group_name = azurerm_resource_group.testrg.name
}