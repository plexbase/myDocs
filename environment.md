# Environment

Infrastructure and environment configuration details.

---

## Azure

| Property | Value |
|----------|-------|
| **Subscription Name** | Visual Studio Enterprise Subscription |
| **Subscription ID** | `298eadfa-2574-4c34-9ab6-4293a4e7e12a` |
| **Tenant ID** | `d91aafde-ef81-4f1a-9918-96df9cf6542b` |
| **State** | Enabled |

---

## Terraform Remote State Backend

Terraform state is stored in an Azure Storage Account. Configure the backend block as follows:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "<tfstate-resource-group>"   # To be created
    storage_account_name = "<tfstate-storage-account>"  # To be created
    container_name       = "tfstate"
    key                  = "<project>.terraform.tfstate"
  }
}
```

| Property | Value |
|----------|-------|
| **Resource Group** | *TBD — to be provisioned* |
| **Storage Account** | *TBD — to be provisioned* |
| **Container** | `tfstate` |
| **State Locking** | Enabled (Azure Blob lease) |

> **Note:** The storage account for Terraform state will be the one exception that is created manually or via a bootstrap script before Terraform can manage itself.

---

## GitHub

| Property | Value |
|----------|-------|
| **Account** | [plexbase](https://github.com/plexbase) |
| **Repositories** | [myDocs](https://github.com/plexbase/myDocs) |

### GitHub Actions — Deployment Pipeline

All infrastructure deployments go through GitHub Actions. Required setup:

| Component | Details |
|-----------|---------|
| **Service Principal** | *TBD — to be created for GitHub Actions auth* |
| **Federated Credentials** | Use OIDC (recommended) or client secret stored in GitHub Secrets |
| **Required Secrets** | `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID` |
| **Workflow Trigger** | Push to `main` branch or manual dispatch |

---

## Local Development

| Property | Value |
|----------|-------|
| **OS** | Windows |
| **Editor** | VS Code |
| **Shell** | PowerShell |
| **Terraform** | *To be installed* |
| **Azure CLI** | Installed |
| **GitHub CLI** | Installed |

---

> **Security Notice:** Do not store secrets, passwords, or access keys in this file. Use Azure Key Vault or environment variables for sensitive values.
