terraform {
  backend "azurerm" {
    resource_group_name  = "shivamterraform"
    storage_account_name = "shivamterraform"
    container_name       = "shivamterraform"
    key                  = "development.terraform.tfstate"
  }
}


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "hpcc" {
  name     = var.resource_group_name
  location = "West Europe"
}


resource "azurerm_kubernetes_cluster" "aks-gh-tf" {
  name                = var.name
  location            = azurerm_resource_group.hpcc.location
  resource_group_name = azurerm_resource_group.hpcc.name
  dns_prefix          = "${var.name}-dns01"

  kubernetes_version = var.k8s_version

  
  network_profile {
  network_plugin = "azure"
  network_policy = "azure"
}

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = "Standard_D2as_v4"
    
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
  }
}