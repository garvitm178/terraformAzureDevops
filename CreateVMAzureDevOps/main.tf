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
    access_key           = "++B7LTNi007PI+iLh/6NVOCVtNElvKryUE7PRJSwObClNOGfUixl+hjlGY2h3djKalKbHtDtnbi/+ASt79tvZA=="
  }
}   

resource "azurerm_resource_group" "r1" {
name="r1"
location="West Europe"  
}
