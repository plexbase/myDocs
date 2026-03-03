# Azure Naming Convention Standard

A naming standard for all Azure resources, based on [Microsoft Cloud Adoption Framework best practices](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming).

---

## Naming Pattern

All Azure resources follow this pattern:

```
<abbreviation>-<workload/project>-<environment>-<region>-<instance>
```

| Component | Description | Examples |
|-----------|-------------|----------|
| **Abbreviation** | Resource type prefix from Microsoft CAF | `rg`, `vm`, `st`, `vnet` |
| **Workload/Project** | Application or project name | `myapp`, `shared`, `hub` |
| **Environment** | Deployment environment | `prod`, `dev`, `test`, `staging` |
| **Region** | Azure region short name (default: `sc` for Sweden Central) | `sc` (Sweden Central), `we` (West Europe), `ne` (North Europe), `eus` (East US) |
| **Instance** | Instance number (when multiples exist) | `001`, `002` |

### Examples

```
rg-myapp-prod-sc-001         # Resource group
vnet-myapp-prod-sc-001       # Virtual network
st-myapp-prod-sc-001         # Storage account (no hyphens allowed: stmyappprodsc001)
kv-myapp-prod-sc-001         # Key Vault
vm-myapp-prod-sc-001         # Virtual machine
```

---

## Rules

1. **Use lowercase** for all resource names.
2. **Use hyphens** (`-`) as delimiters between components, except where the resource type does not allow them (e.g., Storage Accounts).
3. **Abbreviation first** — Always begin the name with the resource type abbreviation.
4. **Environment is mandatory** — Every resource name must include the environment.
5. **Region is optional** — Include when deploying across multiple regions. Omit for global resources or single-region setups.
6. **Instance number is optional** — Include when deploying multiple instances of the same resource.
7. **Keep names short** — Stay within Azure's character limits per resource type. Remove the region or shorten the workload name if needed.
8. **No special characters** — Only use alphanumeric characters and hyphens (where allowed).

---

## Resource Naming Exceptions

Some Azure resources have specific constraints:

| Constraint | Affected Resources | Rule |
|------------|--------------------|------|
| **No hyphens** | Storage Accounts, Key Vaults (optional) | Concatenate components: `stmyappprodsc001` |
| **Globally unique** | Storage Accounts, Key Vaults, Web Apps | Add a short unique suffix if needed |
| **Max 24 chars** | Storage Accounts | Shorten components to fit |
| **Max 15 chars** | Windows VM computer names | Use abbreviated names: `vm-myapp-p-001` |

---

## Environment Abbreviations

| Environment | Abbreviation |
|-------------|-------------|
| Production | `prod` |
| Development | `dev` |
| Test | `test` |
| Staging | `staging` |
| Quality Assurance | `qa` |
| Sandbox | `sandbox` |

---

## Region Abbreviations

| Azure Region | Abbreviation | Notes |
|--------------|-------------|-------|
| **Sweden Central** | **`sc`** | **Default region for all deployments** |
| West Europe | `we` | |
| North Europe | `ne` | |
| East US | `eus` | |
| East US 2 | `eus2` | |
| West US | `wus` | |
| UK South | `uks` | |
| Norway East | `noe` | |

> Add regions as needed for your deployments.

### Default Region Policy

**Sweden Central (`swedencentral`) is the default Azure region for all deployments.**

All resources must be deployed to Sweden Central unless there is a specific, documented reason not to. Valid exceptions include:

- The required resource type or SKU is not available in Sweden Central
- Data residency or compliance requirements mandate a different region
- Latency requirements dictate proximity to a specific geographic area
- A dependent resource already exists in another region and cross-region is not viable

> **WARNING:** If a resource is deployed to any region other than Sweden Central, it **must** be explicitly flagged with:
> 1. A comment in the Terraform code explaining why
> 2. The tag `region-exception: <reason>` on the resource
> 3. A note in the deployment PR describing the exception

---

## Resource Abbreviations (Most Used)

Based on [Microsoft CAF abbreviation recommendations](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations).

### General

| Resource | Abbreviation | Example |
|----------|-------------|---------|
| Resource Group | `rg` | `rg-myapp-prod-sc-001` |
| Management Group | `mg` | `mg-platform-prod` |
| Policy Definition | *descriptive* | `policy-require-tags` |

### Networking

| Resource | Abbreviation | Example |
|----------|-------------|---------|
| Virtual Network | `vnet` | `vnet-myapp-prod-sc-001` |
| Subnet | `snet` | `snet-frontend-prod-sc-001` |
| Network Security Group | `nsg` | `nsg-frontend-prod-sc-001` |
| Network Interface | `nic` | `nic-vm01-prod-sc-001` |
| Public IP Address | `pip` | `pip-myapp-prod-sc-001` |
| Load Balancer (internal) | `lbi` | `lbi-myapp-prod-sc-001` |
| Load Balancer (external) | `lbe` | `lbe-myapp-prod-sc-001` |
| Application Gateway | `agw` | `agw-myapp-prod-sc-001` |
| Route Table | `rt` | `rt-myapp-prod-sc-001` |
| NAT Gateway | `ng` | `ng-myapp-prod-sc-001` |
| Private Endpoint | `pep` | `pep-st-myapp-prod-sc-001` |
| VPN Gateway | `vpng` | `vpng-hub-prod-sc-001` |
| Virtual Network Peering | `peer` | `peer-hub-to-spoke-prod` |
| Azure Firewall | `afw` | `afw-hub-prod-sc-001` |
| Azure Bastion | `bas` | `bas-hub-prod-sc-001` |

### Compute

| Resource | Abbreviation | Example |
|----------|-------------|---------|
| Virtual Machine | `vm` | `vm-web-prod-sc-001` |
| VM Scale Set | `vmss` | `vmss-web-prod-sc-001` |
| Availability Set | `avail` | `avail-web-prod-sc-001` |
| Managed Disk (OS) | `osdisk` | `osdisk-vm01-prod-sc-001` |
| Managed Disk (data) | `disk` | `disk-vm01-prod-sc-001` |
| App Service Plan | `asp` | `asp-myapp-prod-sc-001` |
| Web App | `app` | `app-myapp-prod-sc-001` |
| Function App | `func` | `func-myapp-prod-sc-001` |
| Static Web App | `stapp` | `stapp-myapp-prod-sc-001` |

### Containers

| Resource | Abbreviation | Example |
|----------|-------------|---------|
| AKS Cluster | `aks` | `aks-myapp-prod-sc-001` |
| Container Registry | `cr` | `crmyappprodsc001` |
| Container Instance | `ci` | `ci-myapp-prod-sc-001` |
| Container App | `ca` | `ca-myapp-prod-sc-001` |

### Storage

| Resource | Abbreviation | Example |
|----------|-------------|---------|
| Storage Account | `st` | `stmyappprodsc001` |
| File Share | `share` | `share-config-prod` |
| Backup Vault | `bvault` | `bvault-myapp-prod-sc-001` |

### Databases

| Resource | Abbreviation | Example |
|----------|-------------|---------|
| Azure SQL Server | `sql` | `sql-myapp-prod-sc-001` |
| Azure SQL Database | `sqldb` | `sqldb-myapp-prod-sc-001` |
| Cosmos DB | `cosmos` | `cosmos-myapp-prod-sc-001` |
| PostgreSQL | `psql` | `psql-myapp-prod-sc-001` |
| MySQL | `mysql` | `mysql-myapp-prod-sc-001` |
| Redis Cache | `redis` | `redis-myapp-prod-sc-001` |

### Security & Identity

| Resource | Abbreviation | Example |
|----------|-------------|---------|
| Key Vault | `kv` | `kv-myapp-prod-sc-001` |
| Managed Identity | `id` | `id-myapp-prod-sc-001` |
| SSH Key | `sshkey` | `sshkey-vm01-prod-sc-001` |

### Monitoring & Management

| Resource | Abbreviation | Example |
|----------|-------------|---------|
| Log Analytics Workspace | `log` | `log-myapp-prod-sc-001` |
| Application Insights | `appi` | `appi-myapp-prod-sc-001` |
| Automation Account | `aa` | `aa-myapp-prod-sc-001` |
| Action Group | `ag` | `ag-myapp-prod-sc-001` |
| Recovery Services Vault | `rsv` | `rsv-myapp-prod-sc-001` |

### Integration

| Resource | Abbreviation | Example |
|----------|-------------|---------|
| API Management | `apim` | `apim-myapp-prod-sc-001` |
| Logic App | `logic` | `logic-myapp-prod-sc-001` |
| Service Bus Namespace | `sbns` | `sbns-myapp-prod-sc-001` |
| Event Hub Namespace | `evhns` | `evhns-myapp-prod-sc-001` |

### AI & Machine Learning

| Resource | Abbreviation | Example |
|----------|-------------|---------|
| Azure OpenAI Service | `oai` | `oai-myapp-prod-sc-001` |
| AI Search | `srch` | `srch-myapp-prod-sc-001` |
| ML Workspace | `mlw` | `mlw-myapp-prod-sc-001` |

---

## Tagging Standard

All Azure resources **must** include the following tags:

| Tag Name | Description | Example |
|----------|-------------|---------|
| `environment` | Deployment environment | `prod`, `dev`, `test` |
| `project` | Project or workload name | `myapp` |
| `owner` | Responsible person or team | `kjetil` |
| `cost-center` | Billing or cost center | `it-infrastructure` |
| `created-by` | How the resource was created | `terraform` |
| `created-date` | Date of creation | `2026-03-03` |

Optional tags:

| Tag Name | Description | Example |
|----------|-------------|---------|
| `expiry-date` | When the resource should be reviewed/deleted | `2026-06-01` |
| `compliance` | Compliance requirement | `gdpr`, `hipaa` |
| `criticality` | Business criticality level | `high`, `medium`, `low` |

---

## Handling Unlisted Resources

> **Rule:** If a resource is being deployed that does not yet have an entry in this standard, the following process applies:

1. **Check Microsoft CAF** — Look up the resource in the [official abbreviation list](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations).
2. **Propose a name** — Suggest a naming convention following the pattern: `<abbreviation>-<workload>-<environment>-<region>-<instance>`, using the Microsoft CAF abbreviation if available.
3. **Document the proposal** — Add the proposed naming convention as a pending entry in the table below.
4. **Get approval** — The proposed name must be reviewed and approved before the resource is deployed.
5. **Update this standard** — Once approved, add the resource to the appropriate category table above and remove it from pending.

### Pending Approvals

| Resource | Proposed Abbreviation | Proposed Example | Status | Date |
|----------|-----------------------|------------------|--------|------|
| *None currently* | — | — | — | — |

---

## References

- [Microsoft CAF — Define your naming convention](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming)
- [Microsoft CAF — Abbreviation recommendations for Azure resources](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
- [Microsoft CAF — Define your tagging strategy](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-tagging)
- [Azure Naming Tool](https://github.com/mspnp/AzureNamingTool)

---

> **This is a living document.** Update it as new resource types are needed.
