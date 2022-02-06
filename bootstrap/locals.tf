locals {
  location            = "westeurope"
  resource_group_name = "adf-terraform"
  kv_name             = "adfkvavinash"

  postgres_name = "adfpostgresavinash"
  database_name = "data"

  datalake_name  = "adfdatalakeavinash"
  container_name = "data"

  personal_ip = jsondecode(data.http.personal_ip.body)
}