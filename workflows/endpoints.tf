resource "azurerm_data_factory_dataset_delimited_text" "file" {
  name                = local.filename
  resource_group_name = data.azurerm_resource_group.rg.name
  data_factory_id     = data.azurerm_data_factory.adf.id
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.source.name

  azure_blob_storage_location {
    container = "source"
    filename  = "cars"
  }

  column_delimiter    = ","
  escape_character    = "\\"
  quote_character     = "\""
  row_delimiter       = "\n"
  first_row_as_header = true
}