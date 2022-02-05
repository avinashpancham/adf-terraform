data "azurerm_resource_group" "rg" {
  name = local.resource_group_name
}

data "azurerm_storage_account" "datalake" {
  name                = local.datalake_name
  resource_group_name = data.azurerm_resource_group.rg.name
}