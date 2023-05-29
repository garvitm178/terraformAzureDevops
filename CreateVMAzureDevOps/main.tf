terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}   

resource "azurerm_resource_group" "r1" {
name="r1"
location="West Europe"  
}