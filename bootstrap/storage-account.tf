resource "azurerm_storage_account" "source" {
  name                     = local.source_storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = false
}

resource "azurerm_storage_container" "data" {
  name                 = local.data_container_name
  storage_account_name = azurerm_storage_account.source.name
}


resource "azurerm_storage_blob" "file" {
  name                   = local.blob_name
  storage_account_name   = azurerm_storage_account.source.name
  storage_container_name = azurerm_storage_container.data.name
  type                   = "Block"
  source                 = local.raw_filename
}