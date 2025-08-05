// Main resources for modular Data Factory ETL pipelines and schedule triggers

locals {
  // Example pipeline definitions (modular, extensible)
  pipeline_definitions = {
    sales_etl = jsonencode({
      name       = "sales_etl"
      properties = {
        activities = [
          {
            name = "ExtractSalesData"
            type = "Copy"
            dependsOn = []
            typeProperties = {
              source = { type = "AzureSqlSource" }
              sink   = { type = "AzureBlobSink" }
            }
            inputs = [{ referenceName = "SalesSource", type = "DatasetReference" }]
            outputs = [{ referenceName = "SalesLanding", type = "DatasetReference" }]
          }
        ]
        parameters = {}
      }
    })
    website_etl = jsonencode({
      name       = "website_etl"
      properties = {
        activities = [
          {
            name = "ExtractWebsiteData"
            type = "Copy"
            dependsOn = []
            typeProperties = {
              source = { type = "AzureBlobSource" }
              sink   = { type = "AzureBlobSink" }
            }
            inputs = [{ referenceName = "WebsiteSource", type = "DatasetReference" }]
            outputs = [{ referenceName = "WebsiteLanding", type = "DatasetReference" }]
          }
        ]
        parameters = {}
      }
    })
  }
}

// Create a pipeline for each name in pipeline_names
resource "azurerm_data_factory_pipeline" "etl" {
  for_each       = toset(var.pipeline_names)
  name           = each.key
  data_factory_id = var.data_factory_id
  // Modular pipeline definition
  activities_json = local.pipeline_definitions[each.key]
  tags           = var.tags
}

// Create a schedule trigger for each pipeline
resource "azurerm_data_factory_trigger_schedule" "etl" {
  for_each        = toset(var.pipeline_names)
  name            = "${each.key}_trigger"
  data_factory_id = var.data_factory_id
  pipeline_name   = azurerm_data_factory_pipeline.etl[each.key].name
  interval        = var.trigger_interval
  frequency       = var.trigger_frequency
  start_time      = var.trigger_start_time
  activated       = true
  tags            = var.tags
}

// Comments:
// - To add new pipelines, extend local.pipeline_definitions and var.pipeline_names.
// - Each trigger is linked to its pipeline by name.
// - Pipeline activities are defined as JSON for flexibility and extensibility.
