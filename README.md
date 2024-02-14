## Terraform AKS GitHub Action

This repository serves as a demonstration of using GitHub Actions to deploy and manage Terraform-based AKS (Azure Kubernetes Service) modules.

### Overview

The Terraform state is stored in an Azure storage account The infrastructure is defined in the `main.tf` file.

### GitHub Workflows

1. **Deployment Workflow** ([Deployment.yml](https://github.com/championshuttler/terraform-aks-ghAction/blob/main/.github/workflows/aks-deployment.yml)): This workflow takes the Terraform module and variables as input, creating the necessary resources in the Azure Portal.

2. **Destruction Workflow** ([Destroy.yml](https://github.com/championshuttler/terraform-aks-ghAction/blob/main/.github/workflows/aks-destroy.yml)): This workflow deletes previously created resources, leveraging the Terraform state saved in the backend container within an Azure storage account.

### Usage

Azure service principal credentials are used to authenticate into the Azure subscription. All sensitive information, such as credentials, is securely stored in GitHub Action Secrets and accessed via variables in the action files.

```yaml
ARM_CLIENT_ID: ${{ secrets.AZURE_CLIENT_ID }}
ARM_CLIENT_SECRET: ${{ secrets.AZURE_CLIENT_SECRET }}
ARM_SUBSCRIPTION_ID: ${{ secrets.AZURE_SUBSCRIPTION }}
ARM_TENANT_ID: ${{ secrets.AZURE_TENANT_ID }}
```

### Continuous Integration/Continuous Deployment (CI/CD)

This repository demonstrates a basic CI/CD pipeline using GitHub Actions. It automates the deployment and destruction of infrastructure on Azure using Terraform, promoting better development practices and ease of management.

### Contributions

Contributions are welcome. Please feel free to fork this repository and submit pull requests with improvements or additional features.

### License

This project is licensed under the [MIT License](LICENSE), allowing for modification and distribution for both commercial and non-commercial purposes.
