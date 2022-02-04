resource "azurerm_storage_account" "source" {
  name                     = "adfsourceavinash"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = false
}

resource "azurerm_storage_container" "source" {
  name                 = "source"
  storage_account_name = azurerm_storage_account.source.name
}


resource "azurerm_storage_blob" "file" {
  name                   = "Cars93.csv"
  storage_account_name   = azurerm_storage_account.source.name
  storage_container_name = azurerm_storage_container.source.name
  type                   = "Block"
  source                 = "Cars93.csv"
}