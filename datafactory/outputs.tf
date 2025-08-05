# Outputs for Data Factory Pipelines and Triggers

output "pipeline_ids" {
  description = "Map of pipeline names to their resource IDs."
  value       = { for k, v in azurerm_data_factory_pipeline.etl : k => v.id }
}

output "trigger_ids" {
  description = "Map of trigger names to their resource IDs."
  value       = { for k, v in azurerm_data_factory_trigger_schedule.etl : k => v.id }
}
