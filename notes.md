# Notes

General information, references, and miscellaneous notes.

---

## Table of Contents

- [Quick References](#quick-references)
- [Useful Links](#useful-links)
- [Tools & Setup](#tools--setup)
- [Workflow Overview](#workflow-overview)
- [Scratch Pad](#scratch-pad)

---

## Quick References

### Common Commands
| Tool | Command | Description |
|------|---------|-------------|
| Git | `git status` | Check repo status |
| GitHub CLI | `gh repo list` | List repositories |
| Azure CLI | `az login` | Sign in to Azure |
| Azure CLI | `az group list` | List resource groups |
| Terraform | `terraform init` | Initialize working directory |
| Terraform | `terraform plan` | Preview changes |
| Terraform | `terraform apply` | Apply changes |
| Terraform | `terraform fmt` | Format code |
| Terraform | `terraform validate` | Validate configuration |

---

## Useful Links

- [GitHub](https://github.com/plexbase)
- [Azure Portal](https://portal.azure.com)
- [Microsoft Docs](https://learn.microsoft.com)
- [Terraform Azure Provider Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Terraform Language Docs](https://developer.hashicorp.com/terraform/language)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [Azure OIDC for GitHub Actions](https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure)

---

## Tools & Setup

### My Environment
- **OS:** Windows
- **Editor:** VS Code
- **Shell:** PowerShell

---

## Workflow Overview

```
1. Write Terraform code locally
2. Push to GitHub repository
3. GitHub Actions runs: fmt → validate → plan
4. Review plan output in PR
5. Merge to main → GitHub Actions runs: terraform apply
6. State stored in Azure Storage Account
```

**Golden rule:** No direct changes in Azure. Everything through Terraform + GitHub Actions.

---

## Scratch Pad

<!-- Temporary notes, ideas, and things to remember -->

---

> **Tip:** Use this file as a catch-all for information that doesn't fit elsewhere.
