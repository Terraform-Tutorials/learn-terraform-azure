provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "grupo-recurso" {
  location = "brazilsouth"
  name = "rg-terraform-test"
  tags = {
    data = formatdate("DD MMM YYYY hh:mm ZZZ", "2018-01-02T23:12:01Z")
  }
}

variable "vnetips" {
  type = list
  default = [ "10.0.0.0/16" ]
}

resource "azurerm_virtual_network" "vnet" {
  name = "vnettreinamentoazure"
  location = "brazilsouth"
  resource_group_name = "rg-terraform-mod5"
  address_space = concat(var.vnetips, [ "192.168.0.0./16" ])
}

output "vnet-numeroips" {
  value = lenght("${azure_virtual_network.vnet.address_space}")
}