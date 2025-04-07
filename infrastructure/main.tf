terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "remote" {
    organization = "SivajiRaavi"

    workspaces {
      name = "dev"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "example" {
  name                = "example-vnet-${var.environment}"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}
