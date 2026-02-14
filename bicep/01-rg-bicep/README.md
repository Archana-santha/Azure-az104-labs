## Infrastructure as Code (Bicep)

Bicep templates to deploy Azure resources using Infrastructure as Code.

### Resource Group Deployment

[rg.bicep](rg.bicep)


This template deploys a Resource Group at subscription scope.

### Deploy using Azure CLI

```bash
az deployment sub create --location westus2 --template-file bicep/rg.bicep
