locals {
  resource_group_name = "adf-terraform"

  source_storage_account_name = "adfsourceavinash"
  data_container_name         = "data"
  blob_name                   = "cars"

  datalake_name     = "adfdatalakeavinash"
  raw_sink_filename = "cars.parquet"

  source_csv_name   = "source_csv"
  sink_parquet_name = "sink_parquet"
}