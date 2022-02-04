resource "azurerm_data_factory" "adf" {
  name                = local.resource_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  public_network_enabled = false
}

