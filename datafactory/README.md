# Azure Data Factory ETL Pipelines & Triggers

This module defines modular Azure Data Factory pipelines for ETL of sales and website data, with schedule triggers for nightly or weekly runs.

## Features
- Modular pipeline creation (add new sources by extending `pipeline_names`)
- Schedule triggers (nightly by default, configurable for weekly)
- Outputs pipeline and trigger IDs for downstream use

## Usage
```hcl
module "datafactory_etl" {
  source             = "./datafactory"
  data_factory_id    = module.datafactory.data_factory_id
  pipeline_names     = ["sales_etl", "website_etl"] # Add more as needed
  trigger_frequency  = "Day"   # or "Week"
  trigger_interval   = 1       # 1 for nightly, 7 for weekly
  trigger_start_time = "2024-01-01T02:00:00Z"
  tags               = var.tags
}
```

## Adding New Pipelines
- Add the new pipeline name to `pipeline_names`.
- Add a corresponding JSON definition in the `main.tf` locals block or as an external file.

## Outputs
- `pipeline_ids`: Map of pipeline names to their resource IDs
- `trigger_ids`: Map of trigger names to their resource IDs

## Extensibility
- Pipelines are defined as JSON for easy modification.
- Triggers are parameterized for flexible scheduling.

## References
- [azurerm_data_factory_pipeline](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_pipeline)
- [azurerm_data_factory_trigger_schedule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_trigger_schedule)
