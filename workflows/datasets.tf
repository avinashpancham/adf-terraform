resource "azurerm_data_factory_dataset_postgresql" "source_table" {
  name                = local.source_sql_name
  resource_group_name = data.azurerm_resource_group.rg.name
  data_factory_id     = data.azurerm_data_factory.adf.id
  linked_service_name = azurerm_data_factory_linked_service_postgresql.postgres.name
  table_name          = local.table_name
}

resource "azurerm_data_factory_dataset_parquet" "sink_parquet" {
  name                = local.sink_parquet_name
  resource_group_name = data.azurerm_resource_group.rg.name
  data_factory_id     = data.azurerm_data_factory.adf.id
  linked_service_name = azurerm_data_factory_linked_service_data_lake_storage_gen2.datalake.name
  compression_codec   = "snappy"

  azure_blob_storage_location {
    container = local.container_name
    path      = terraform.workspace
    filename  = local.sink_filename
  }
}