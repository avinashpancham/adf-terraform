locals {
  name          = "adf-terraform"
  resource_name = "${local.name}-${terraform.workspace}"
}