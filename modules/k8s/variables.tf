variable "resource_group" {
    description = "name of resource group"
    type = string
}
variable "location" {
    description = "Placement of resources"
    type = string
    default = "West Europe"
}

variable "acr_name" {
    type = string
    description = "name of Azure Container Registry"
}

variable "cluster_name" {
  type = string
    description = "name of AKS cluser"
}