locals {
  resource_group_name = "adf-terraform"
  kv_name             = "adfkvavinash"

  postgres_name = "adfpostgresavinash"
  database_name = "data"
  table_name    = "cars"

  datalake_name  = "adfdatalakeavinash"
  container_name = "data"
  sink_filename  = "cars.parquet"

  source_sql_name   = "source_table"
  sink_parquet_name = "sink_parquet"
}