resource "azurerm_storage_data_lake_gen2_path" "data" {
  path               = terraform.workspace
  filesystem_name    = local.data_container_name
  storage_account_id = data.azurerm_storage_account.datalake.id
  resource           = "directory"
}