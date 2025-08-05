# Synapse Analytics Workspace Terraform Module

This module provisions an Azure Synapse Analytics Workspace suitable for reporting workloads (e.g., Power BI) using best practices.

## Features
- Creates a Synapse workspace in the specified resource group and region
- Associates the workspace with an existing Data Lake Gen2 filesystem for consolidated data
- Configures SQL admin login for workspace access
- Enables system-assigned managed identity for secure access
- Outputs workspace ID and connectivity endpoints for reporting tools

## Usage
```hcl
module "synapse" {
  source = "./synapse"

  resource_group_name                  = var.resource_group_name
  location                             = var.location
  synapse_workspace_name               = "my-synapse-workspace"
  storage_data_lake_gen2_filesystem_id = module.storage.data_lake_filesystem_id
  sql_administrator_login              = var.sql_admin_login
  sql_administrator_login_password     = var.sql_admin_password
  tags                                 = var.tags
}
```

## Inputs
- `resource_group_name`: Name of the resource group
- `location`: Azure region
- `synapse_workspace_name`: Name for the Synapse workspace
- `storage_data_lake_gen2_filesystem_id`: ID of the Data Lake Gen2 filesystem
- `sql_administrator_login`: SQL admin login name (sensitive)
- `sql_administrator_login_password`: SQL admin password (sensitive)
- `tags`: Map of tags (optional)

## Outputs
- `synapse_workspace_id`: The Synapse workspace resource ID
- `synapse_workspace_endpoints`: Map of connectivity endpoints (dev, sql, sqlOnDemand, web)

## Notes
- This module assumes the Data Lake Gen2 filesystem already exists (see `storage/` module).
- For advanced security (e.g., customer-managed keys, private endpoints), extend the resource block as needed.
- See the [Terraform Synapse Workspace documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace) for all available options.
