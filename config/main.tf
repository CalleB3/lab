terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "dev" {
  name     = var.resource_group
  location = var.location
}

module "VM-RDP" {
    source = "../modules/webserver"
    resource_group            = var.resource_group
    location                  = var.location
    depends_on                = [azurerm_resource_group.dev]
    virtual_machine_name      = "MyVMIsCool"
    virtual_machine_size      = "Standard_B1s"
    virtual_network_name      = "ThisIsMyNetwork"
    virtual_network_interface = "ThisIsTheInterface"
}