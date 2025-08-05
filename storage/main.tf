provider "azurerm" {
  features {}
}

# Create the resource group (if not already present)
resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

# Data Lake Storage Account using AVM module
# module "data_lake" {
#   source                  = "terraform-azure-modules/avm-res-storage-storageaccount/azurerm"
#   name                    = var.storage_account_name
#   resource_group_name     = azurerm_resource_group.this.name
#   location                = azurerm_resource_group.this.location
#   is_hns_enabled          = true
#   account_replication_type = "ZRS"
#   access_tier             = "Hot"
#   tags                    = var.tags
#
#   # Create containers for landing and staging data
#   containers = {
#     landing = {
#       name = "landing"
#     }
#     staging = {
#       name = "staging"
#     }
#   }
#
#   # Optional: Network rules for security
#   network_rules = var.network_rules
#
#   # Optional: Private endpoints for security
#   private_endpoints = var.enable_private_endpoints ? {
#     blob = {
#       subnetresourceid = var.private_endpoint_subnet_id
#       subresourcename  = "blob"
#     }
#     dfs = {
#       subnetresourceid = var.private_endpoint_subnet_id
#       subresourcename  = "dfs"
#     }
#   } : {}
# }
