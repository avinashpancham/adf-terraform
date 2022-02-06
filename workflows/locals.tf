locals {
  resource_group_name = "adf-terraform"
  kv_name             = "adfkv${data.azurerm_resource_group.rg.tags["uid"]}"

  postgres_name = "adfpostgres${data.azurerm_resource_group.rg.tags["uid"]}"
  database_name = "data"
  table_name    = "cars"

  datalake_name  = "adfdatalake${data.azurerm_resource_group.rg.tags["uid"]}"
  container_name = "data"
  sink_filename  = "cars.parquet"

  pipeline_name     = "copy-pipeline"
  source_sql_name   = "source_table"
  sink_parquet_name = "sink_parquet"
}