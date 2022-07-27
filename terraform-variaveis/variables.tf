variable "location" {
  type = string
  description = "Localizao dos recursos do Azure."
  default = "brazilsouth"
}

variable "tags" {
  type = map
  description = "tags nos recursos e servicos do azure"
  default = {
    ambiente = "desenvolvimento"
    responsavel = "Amaury"
  }
}

variable "vnet-enderecos" {
  type = list
  default = ["10.0.0.0.0/16", "192.168.0.0./15"]
}