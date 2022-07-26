terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.15.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
}

resource "azurerm_resource_group" "teste-group" {
    name = "rgterraform"
    location = "brazilsouth"
  
}