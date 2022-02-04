data "azurerm_resource_group" "rg" {
  name = local.name
}

data "azurerm_data_factory" "adf" {
  name                = local.resource_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_storage_account" "source" {
  name                = local.storage_account_name
  resource_group_name = data.azurerm_resource_group.rg.name
}