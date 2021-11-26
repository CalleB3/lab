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

provider "kubernetes" {
    config_path = [
    config/
  ]
}
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "dev-aks1"
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = "dev-aks1"

  default_node_pool {
    name       = "default-nodes"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
