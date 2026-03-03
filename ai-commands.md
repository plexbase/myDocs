# AI Commands

A collection of prompts, commands, and templates for working with AI assistants.

---

## Table of Contents

- [Code Generation](#code-generation)
- [Code Review](#code-review)
- [Documentation](#documentation)
- [Troubleshooting](#troubleshooting)
- [Terraform](#terraform)

---

## Code Generation

### Template: Generate a new function
```
Write a [language] function that [description]. 
It should accept [inputs] and return [output]. 
Include error handling and comments.
```

### Template: Generate unit tests
```
Write unit tests for the following function: [paste function]. 
Cover edge cases and expected failures.
```

---

## Code Review

### Template: Review my code
```
Review the following code for bugs, performance issues, and best practices: 
[paste code]
```

---

## Documentation

### Template: Generate documentation
```
Write documentation for the following code/API: [paste code]. 
Include usage examples and parameter descriptions.
```

---

## Troubleshooting

### Template: Debug an error
```
I'm getting the following error: [paste error]. 
Here is the relevant code: [paste code]. 
Explain the cause and suggest a fix.
```

---

## Terraform

### Template: Create a new Terraform module
```
Create a Terraform module for [resource type] in Azure.
Use azurerm provider. Include variables.tf, outputs.tf, and main.tf.
Follow naming convention: <project>-<environment>-<resource>.
Remote state backend is in Azure Storage Account.
```

### Template: Add a resource to existing Terraform
```
Add a [resource type] to the existing Terraform configuration in [directory].
Follow the existing code style and variable patterns.
Do not deploy directly — this will go through GitHub Actions.
```

### Template: Create GitHub Actions workflow for Terraform
```
Create a GitHub Actions workflow that:
1. Runs terraform fmt and validate on pull requests
2. Runs terraform plan and posts the output as a PR comment
3. Runs terraform apply on merge to main
Use OIDC authentication with Azure.
```

### Template: Bootstrap Terraform backend
```
Create a script to bootstrap the Terraform remote state backend:
- Resource group, storage account, and blob container in Azure
- Enable state locking
- Output the backend configuration block
```

---

> **Tip:** Customize these templates to fit your workflow. Add new sections as needed.
