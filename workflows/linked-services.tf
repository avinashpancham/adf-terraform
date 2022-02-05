resource "azurerm_data_factory_linked_service_azure_blob_storage" "source_storage" {
  name                = local.source_storage_account_name
  resource_group_name = data.azurerm_resource_group.rg.name
  data_factory_id     = data.azurerm_data_factory.adf.id
  connection_string   = data.azurerm_storage_account.source.primary_connection_string
}

resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "datalake" {
  name                = local.datalake_name
  resource_group_name = data.azurerm_resource_group.rg.name
  data_factory_id     = data.azurerm_data_factory.adf.id

  storage_account_key = data.azurerm_storage_account.datalake.primary_access_key
  url                 = data.azurerm_storage_account.datalake.primary_dfs_endpoint
}
