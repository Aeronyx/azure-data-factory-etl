# Azure Data Lake Storage (Gen2) Terraform Module

This configuration provisions an Azure Resource Group and a Storage Account configured as a Data Lake (Gen2) for consolidated sales and website data landing and staging. It uses the community AVM storage account module for best practices.

## Features
- Creates a resource group (if not already present)
- Provisions a Storage Account with hierarchical namespace enabled (Data Lake Gen2)
- Configures replication (default: ZRS) and access tier (default: Hot)
- Creates containers/filesystems for staging data
- Supports network rules and optional private endpoints for security
- Outputs storage account name, resource ID, and FQDNs

## Usage

```
module "data_lake" {
  source                  = "terraform-azure-modules/avm-res-storage-storageaccount/azurerm"
  name                    = var.storage_account_name
  resource_group_name     = var.resource_group_name
  location                = var.location
  is_hns_enabled          = true
  account_replication_type = "ZRS"
  access_tier             = "Hot"
  tags                    = var.tags
  containers = {
    landing = {
      name = "landing"
    }
    staging = {
      name = "staging"
    }
  }
  network_rules           = var.network_rules
  private_endpoints = var.enable_private_endpoints ? {
    blob = {
      subnetresourceid = var.private_endpoint_subnet_id
      subresourcename  = "blob"
    }
    dfs = {
      subnetresourceid = var.private_endpoint_subnet_id
      subresourcename  = "dfs"
    }
  } : {}
}
```

## Inputs
- `resource_group_name`: Name of the resource group
- `location`: Azure region
- `storage_account_name`: Globally unique storage account name
- `tags`: Tags for resources
- `enable_private_endpoints`: Enable private endpoints (default: false)
- `private_endpoint_subnet_id`: Subnet ID for private endpoint (if enabled)
- `network_rules`: Network rules object (see variables.tf)

## Outputs
- `storage_account_name`: The name of the Storage Account
- `storage_account_id`: The resource ID of the Storage Account
- `storage_account_fqdn`: FQDNs for storage services

---
Module: [terraform-azurerm-avm-res-storage-storageaccount](https://registry.terraform.io/modules/terraform-azure-modules/avm-res-storage-storageaccount/azurerm/latest)
