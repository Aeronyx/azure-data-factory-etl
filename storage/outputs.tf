output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = module.data_lake.name
}

output "storage_account_id" {
  description = "The resource ID of the Storage Account."
  value       = module.data_lake.resource_id
}

output "storage_account_fqdn" {
  description = "The FQDNs for storage services."
  value       = module.data_lake.fqdn
}
