terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.95.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-backend"
    storage_account_name = "terraformavinash"
    container_name       = "terraform-tfstate"
    key                  = "adf-infra.tfstate"
  }
}

provider "azurerm" {
  features {}
}
