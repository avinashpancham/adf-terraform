locals {
  name                 = "adf-terraform"
  resource_name        = "${local.name}-${terraform.workspace}"
  storage_account_name = "adfsourceavinash"
  datalake_name        = "adfdatalakeavinash"
  filename             = "cars"

}