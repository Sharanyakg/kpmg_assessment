resource "azurerm_app_service" "backend" {
  name                = "backend-app"
  location            = azurerm_resource_group.assessment.location
  resource_group_name = azurerm_resource_group.assessment.name
  app_service_plan_id = azurerm_app_service_plan.frontend.id

  site_config {
    dotnet_framework_version = "v4.0"
  }

  app_settings = {
    "SQL_CONNECTION_STRING" = data.azurerm_key_vault_secret.sql_connection_string.value
  }
}
