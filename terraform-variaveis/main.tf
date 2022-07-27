provider "azurerm" {
  features{}
}

variable "location" {
  type = string
  description = "Localizao dos recursos do Azure."
  default = "brazilsouth"
}

resource "azurerm_resource_group" "grupo-recurso" {
  name = "rg-variaveis"
  location = var.location
  
}