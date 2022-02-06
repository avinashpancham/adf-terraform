terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.95.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }

  }

  backend "azurerm" {
    resource_group_name  = "terraform-backend"
    storage_account_name = "terraformavinash"
    container_name       = "terraform-tfstate"
    key                  = "adf-bootstrap.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "random" {
}

