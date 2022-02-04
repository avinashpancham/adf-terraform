resource "azurerm_resource_group" "rg" {
  name     = local.name
  location = local.location
}
