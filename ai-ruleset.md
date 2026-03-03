# AI Ruleset

Rules and guidelines for AI assistants when working on my projects.

---

## General Rules

1. **Be concise** — Keep responses short and to the point unless I ask for detail.
2. **No fluff** — Skip unnecessary introductions, summaries, and filler text.
3. **Ask before assuming** — If requirements are unclear, ask for clarification rather than guessing.
4. **Implement, don't suggest** — When I ask for changes, make them directly instead of just describing what to do.

---

## Code Style

1. **Follow existing conventions** — Match the coding style already used in the project.
2. **Comment sparingly** — Only add comments where the logic is non-obvious.
3. **Prefer readability** — Write clear, maintainable code over clever one-liners.
4. **Error handling** — Always include proper error handling unless told otherwise.

---

## Communication

1. **No emojis** unless I use them first.
2. **Use Markdown** formatting in responses.
3. **File references** should include paths and line numbers when relevant.
4. **Progress updates** — For multi-step tasks, track progress and report status.

---

## Infrastructure & Deployment Rules

1. **Terraform is the standard** — All infrastructure must be defined as Terraform code. No manual resource creation in Azure.
2. **Remote state in Azure Storage** — Terraform state files must be stored in an Azure Storage Account backend, never locally.
3. **Deploy via GitHub Actions only** — All deployments to Azure must go through GitHub Actions pipelines. No direct `az` CLI deployments or portal changes for production resources.
4. **No direct Azure changes** — Never create, modify, or delete Azure resources directly. Always go through Terraform + GitHub Actions.
5. **Modular Terraform** — Use modules to keep code DRY and reusable. Separate environments using workspaces or directory structure.
6. **Variables and outputs** — Use `variables.tf` and `outputs.tf` in every module. No hardcoded values.
7. **State locking** — Always enable state locking via Azure Blob lease when configuring the backend.
8. **Follow the naming standard** — All Azure resources must be named according to the [Naming Convention Standard](naming-convention.md). No exceptions.
9. **Unlisted resources require proposal** — If deploying a resource not yet in the naming standard, propose a name based on [Microsoft CAF abbreviations](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations), add it to the Pending Approvals table in the naming convention, and get approval before deploying.
10. **Tagging is mandatory** — All resources must include the required tags as defined in the naming convention.

---

## Project-Specific Rules

### Project: Infrastructure (Terraform)
- Language: HCL (Terraform)
- Tools: Terraform, GitHub Actions, Azure CLI
- Backend: Azure Storage Account (remote state)
- Deployment: GitHub Actions workflows only
- Naming convention: See [naming-convention.md](naming-convention.md)

---

> **Note:** Update this ruleset as your preferences evolve.
