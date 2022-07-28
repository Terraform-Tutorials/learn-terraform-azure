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

resource "azurerm_storage_container" "container" {
  name = "terraform"
  storage_account_name = azurerm_storage_account.storagetf.name
  depends_on = [ azurerm_storage_account.storagetf ]
}

output "blobstorage-name" {
  value = "azurerm_storage_account.storagetf.name"
}

output "blobstorage-chave-primaria" {
  value = "azurerm_storage_account.storagetf.primary_access_key"
}

output "blobstorage-chave-secundaria" {
  value = "azurerm_storage_account.storagetf.secondary_access_key"
}
