variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "testrg"
}

variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "East US"
}

variable "app_service_plan_name" {
  description = "The name of the App Service plan"
  type        = string
  default     = "test-appserviceplan"
}

variable "sql_server_name" {
  description = "The name of the SQL server"
  type        = string
  default     = "testsqlserver"
}

variable "sql_database_name" {
  description = "The name of the SQL database"
  type        = string
  default     = "test-sqldatabase"
}

variable "sql_admin_password_secret_name" {
  description = "The administrator username for the SQL server"
  type        = string
  default     = "sqladmin"
}

variable "sql_admin_password_secret_name" {
  description = "The administrator password for the SQL server"
  type        = string
  default     = "sqlpassword"
}

variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
  default     = "assessmentKeyVault"
}

variable "sql_connection_string_secret_name" {
  description = "The name of the secret in Key Vault that contains the SQL connection string"
  type        = string
  default     = "SqlConnectionString"
}
