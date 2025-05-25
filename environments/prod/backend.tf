terraform {
  backend "azurerm" {
    resource_group_name  = "tf-backend-rg"
    storage_account_name = "tfmbackendstore"
    container_name       = "tfmstate"
    key                  = "prod.terraform.tfstate"
  }
}