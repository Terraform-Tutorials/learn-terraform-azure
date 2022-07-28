terraform {
    backend "azurerm" {
        resource_group_name = "terraformstate"
        storage_account_name = "tfstateazuretreinamento"
        container_name = "terraformstate"
        key = "ssasasasasaskkkkkkkwelelelassdusjasnasghfgdfklsdoAAhdfhshshsasaspppolewAsdhashashhhssaADFAGHhhhsssssss=="
    }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "rg-state" {
  name = "rg_terraform_com_state"
  location = "brazilsouth"
}