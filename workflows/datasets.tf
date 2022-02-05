resource "azurerm_data_factory_dataset_delimited_text" "source_csv" {
  name                = local.source_csv_name
  resource_group_name = data.azurerm_resource_group.rg.name
  data_factory_id     = data.azurerm_data_factory.adf.id
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.source_storage.name

  azure_blob_storage_location {
    container = local.data_container_name
    filename  = local.blob_name
  }

  column_delimiter    = ","
  escape_character    = "\\"
  quote_character     = "\""
  row_delimiter       = "\n"
  first_row_as_header = true
}

resource "azurerm_data_factory_dataset_parquet" "sink_parquet" {
  name                = local.sink_parquet_name
  resource_group_name = data.azurerm_resource_group.rg.name
  data_factory_id     = data.azurerm_data_factory.adf.id
  linked_service_name = azurerm_data_factory_linked_service_data_lake_storage_gen2.datalake.name
  compression_codec   = "snappy"

  azure_blob_storage_location {
    container = local.data_container_name
    path      = terraform.workspace
    filename  = local.raw_sink_filename
  }
}