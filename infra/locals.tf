locals {
  resource_group_name = "adf-terraform"
  datalake_name       = "adfdatalake${data.azurerm_resource_group.rg.tags["uid"]}"
  data_container_name = "data"
}