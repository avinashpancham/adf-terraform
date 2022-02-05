resource "azurerm_storage_data_lake_gen2_path" "path" {
  path               = terraform.workspace
  filesystem_name    = "target"
  storage_account_id = data.azurerm_storage_account.datalake.id
  resource           = "directory"
}