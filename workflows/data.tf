data "azurerm_resource_group" "rg" {
  name = local.resource_group_name
}

data "azurerm_data_factory" "adf" {
  name                = terraform.workspace
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_storage_account" "source" {
  name                = local.source_storage_account_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_storage_account" "datalake" {
  name                = local.datalake_name
  resource_group_name = data.azurerm_resource_group.rg.name
}