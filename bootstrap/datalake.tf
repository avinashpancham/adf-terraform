resource "azurerm_storage_account" "datalake" {
  name                     = local.datalake_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
  allow_blob_public_access = false
}

resource "azurerm_storage_data_lake_gen2_filesystem" "datalake" {
  name               = local.data_container_name
  storage_account_id = azurerm_storage_account.datalake.id
}
