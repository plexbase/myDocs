terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tfstate-shared-sc-001"
    storage_account_name = "sttfstatesharedsc001"
    container_name       = "tfstate"
    key                  = "demoapp01.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
