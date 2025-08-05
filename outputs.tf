output "storage_account_id" {
  description = "The resource ID of the storage account."
  value       = module.storage.storage_account_id
}

output "storage_account_name" {
  description = "The name of the storage account."
  value       = module.storage.storage_account_name
}

output "data_factory_id" {
  description = "The resource ID of the Azure Data Factory."
  value       = module.datafactory.data_factory_id
}

output "data_factory_managed_identity_id" {
  description = "The managed identity resource ID for Data Factory."
  value       = module.datafactory.managed_identity_id
}

output "synapse_workspace_id" {
  description = "The resource ID of the Synapse Analytics workspace."
  value       = var.synapse_workspace_name != "" ? module.synapse[0].synapse_workspace_id : null
}

output "synapse_endpoints" {
  description = "Map of Synapse workspace endpoints."
  value       = var.synapse_workspace_name != "" ? module.synapse[0].synapse_endpoints : {}
}
