locals {
  location = "westeurope"


  resource_group_name         = "adf-terraform"
  source_storage_account_name = "adfsourceavinash"
  data_container_name         = "data"
  blob_name                   = "cars"
  raw_filename                = "Cars93.csv"
  datalake_name               = "adfdatalakeavinash"
}