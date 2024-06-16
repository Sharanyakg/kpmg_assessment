resource "azurerm_app_service_plan" "frontend" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "frontend" {
  name                = "frontend-app"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.frontend.id

  site_config {
    dotnet_framework_version = "v4.0"
  }

  app_settings = {
    "SQL_CONNECTION_STRING" = data.azurerm_key_vault_secret.sql_connection_string.value
  }
}
