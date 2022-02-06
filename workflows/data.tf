data "azurerm_resource_group" "rg" {
  name = local.resource_group_name
}

data "azurerm_data_factory" "adf" {
  name                = terraform.workspace
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_postgresql_server" "postgres" {
  name                = local.postgres_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_key_vault" "kv" {
  name                = local.kv_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_key_vault_secret" "db-password" {
  name         = "db-password"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_storage_account" "datalake" {
  name                = local.datalake_name
  resource_group_name = data.azurerm_resource_group.rg.name
}
