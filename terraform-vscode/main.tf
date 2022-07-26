provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "teste-group" {
    name = "rgterraform"
    location = "brazilsouth"
  
}