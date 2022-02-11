locals {
  resource_group_name = "adf-terraform"
  kv_name             = "adfkv${data.azurerm_resource_group.rg.tags["uid"]}"

  postgres_name = "adfpostgres${data.azurerm_resource_group.rg.tags["uid"]}"
  database_name = "data"
  table_name    = "cars"

  datalake_name         = "adfdatalake${data.azurerm_resource_group.rg.tags["uid"]}"
  container_name        = "data"
  sink_parquet_filename = "cars.parquet"

  sink_csv_filename = "cars.csv"

  parquet_pipeline_name = "copy-to-parquet"
  csv_pipeline_name     = "copy-to-csv"
  source_sql_name       = "source_table"
  sink_parquet_name     = "sink_parquet"
  sink_csv_name         = "sink_csv"
}