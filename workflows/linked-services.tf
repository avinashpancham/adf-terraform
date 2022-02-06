resource "azurerm_data_factory_linked_service_postgresql" "postgres" {
  name                = local.postgres_name
  resource_group_name = data.azurerm_resource_group.rg.name
  data_factory_id     = data.azurerm_data_factory.adf.id
  connection_string   = "Host=${data.azurerm_postgresql_server.postgres.fqdn};Port=5432;Database=${local.database_name};UID=${data.azurerm_postgresql_server.postgres.administrator_login}@${data.azurerm_postgresql_server.postgres.name};EncryptionMethod=0;Password=${data.azurerm_key_vault_secret.db-password.value}"
}

resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "datalake" {
  name                = local.datalake_name
  resource_group_name = data.azurerm_resource_group.rg.name
  data_factory_id     = data.azurerm_data_factory.adf.id

  storage_account_key = data.azurerm_storage_account.datalake.primary_access_key
  url                 = data.azurerm_storage_account.datalake.primary_dfs_endpoint
}
