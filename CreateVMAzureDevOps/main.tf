terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  
  backend "azurerm" {
    storage_account_name = "aviopt"
    container_name       = "avimsd"
    key                  = "terraform.tfstate"
    access_key           = "***************************************************************"
  }
}   

resource "azurerm_resource_group" "r1" {
name="r1"
location="West Europe"  
}
