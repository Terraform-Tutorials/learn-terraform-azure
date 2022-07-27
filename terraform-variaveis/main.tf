provider "azurerm" {
  features{}
}

resource "azurerm_resource_group" "grupo-recurso" {
  name = "rg-variaveis"
  location = var.location
  tags = var.tags

}

resource "azurerm_virtual_network" "vnet" {
  name = "vnet-terraform-treinamento"
  resource_group_name = "${azurerm_resource_group.grupo-recurso.name}"
  location = var.location
  address_space = [ "10.0.0.0/16" ]
}