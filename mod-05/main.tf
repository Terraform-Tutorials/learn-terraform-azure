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