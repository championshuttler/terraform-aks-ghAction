# terraform-aks-ghAction

This repository serves as demo on how to use Github Action to deploy and create terraform based AKS modules.

The terraform state is saved in one of stprahe account in Azure. It is defined in main.tf file.

1. Deployment.yml takes the terraform module and variables and create the resources in Azure Portal
2. Destroy.yml deletes the already created resources by deployment.yml, it uses the tfstate saved in backend in one of the container in azure storage account. 
