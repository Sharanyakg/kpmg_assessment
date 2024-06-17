provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-resources"
    storage_account_name = "tfstatesa"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}


resource "azurerm_resource_group" "assessment" {
  name     = var.resource_group_name
  location = var.location
}

data "azurerm_key_vault" "assessment" {
  name                = var.key_vault_name
  resource_group_name = azurerm_resource_group.assessment.name
}

data "azurerm_key_vault_secret" "sql_admin_username" {
  name         = var.sql_admin_username_secret_name
  key_vault_id = data.azurerm_key_vault.assessment.id
}

data "azurerm_key_vault_secret" "sql_admin_password" {
  name         = var.sql_admin_password_secret_name
  key_vault_id = data.azurerm_key_vault.assessment.id
}

data "azurerm_key_vault_secret" "sql_connection_string" {
  name         = var.sql_connection_string_secret_name
  key_vault_id = data.azurerm_key_vault.assessment.id
}
