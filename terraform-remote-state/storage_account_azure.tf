terraform {
    required_providers {
        random = {
            source = "hashicorp/random"
        }

        azurerm = {
            source = hashicorp/azurerm
        }
    }
}

provider "random" {
  
}

provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rgstorage" {
  name = "storagerg"
  location = "brazilsouth"
}

resource "random_string" "random" {
  lenght = 3
  special = false
  upper = false
  number = true
}

resource "azurerm_storage_account" "storagetf" {
  name = "tftreinamento${random_string.random.results}"
  resource_group_name = "storagerg"
  location = "brazsilsouth"
  access_tier = "Standard"
  account_tier = "Hot"
  account_replication_type = "LRS"
}