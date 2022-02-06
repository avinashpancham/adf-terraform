resource "random_id" "suffix" {
  byte_length = 3
}

locals {
  location            = "westeurope"
  resource_group_name = "adf-terraform"
  kv_name             = "adfkv${random_id.suffix.hex}"

  postgres_name = "adfpostgres${random_id.suffix.hex}"
  database_name = "data"

  datalake_name  = "adfdatalake${random_id.suffix.hex}"
  container_name = "data"

  personal_ip = jsondecode(data.http.personal_ip.body)
}