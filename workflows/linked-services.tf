resource "azurerm_data_factory_linked_service_azure_blob_storage" "source" {
  name                = local.storage_account_name
  resource_group_name = data.azurerm_resource_group.rg.name
  data_factory_id     = data.azurerm_data_factory.adf.id
  connection_string   = data.azurerm_storage_account.source.primary_connection_string
}
