# Outputs for Synapse Analytics Workspace

output "synapse_workspace_id" {
  description = "The ID of the Synapse Analytics workspace."
  value       = azurerm_synapse_workspace.this.id
}

output "synapse_workspace_endpoints" {
  description = "A map of connectivity endpoints for the Synapse workspace (dev, sql, sqlOnDemand, web)."
  value       = azurerm_synapse_workspace.this.connectivity_endpoints
}
