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

/*module "VM-RDP" {
    source = "../modules/webserver"
    resource_group            = var.resource_group
    location                  = var.location
    depends_on                = [azurerm_resource_group.dev]
    virtual_machine_name      = "MyVMIsCool"
    virtual_machine_sku       = "Standard_B2s"
    virtual_network_name      = "ThisIsMyNetwork"
    virtual_network_interface = "ThisIsTheInterface"
    virtual_machine_instances = "2"
}*/
module "AKS" {
    depends_on      = [azurerm_resource_group.dev]
    source          = "../modules/k8s"
    resource_group  = var.resource_group
    location        = var.location
    cluster_name    = "akscluster1"
    acr_name        = "ACRcalle"
}


