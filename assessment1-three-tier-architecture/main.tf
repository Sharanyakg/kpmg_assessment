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


resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

data "azurerm_key_vault" "example" {
  name                = var.key_vault_name
  resource_group_name = azurerm_resource_group.example.name
}

data "azurerm_key_vault_secret" "sql_connection_string" {
  name         = var.sql_connection_string_secret_name
  key_vault_id = data.azurerm_key_vault.example.id
}
