# Provision Azure Synapse Analytics Workspace for Reporting Layer
# Uses azurerm_synapse_workspace resource with best practices for reporting

resource "azurerm_synapse_workspace" "this" {
  name                                 = var.synapse_workspace_name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = var.storage_data_lake_gen2_filesystem_id
  sql_administrator_login              = var.sql_administrator_login
  sql_administrator_login_password     = var.sql_administrator_login_password

  # Enable system-assigned managed identity for secure access
  identity {
    type = "SystemAssigned"
  }

  # Tagging for resource organization
  tags = var.tags
}
