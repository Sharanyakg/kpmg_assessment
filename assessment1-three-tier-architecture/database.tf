resource "azurerm_sql_server" "assessment" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.assessment.name
  location                     = azurerm_resource_group.assessment.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.sql_admin_username.value
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_sql_database" "assessment" {
  name                = var.sql_database_name
  resource_group_name = azurerm_resource_group.assessment.name
  location            = azurerm_resource_group.assessment.location
  server_name         = azurerm_sql_server.assessment.name
  sku_name            = "S1"
}
