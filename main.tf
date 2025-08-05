# Root orchestration for Azure ETL platform

module "storage" {
  source                = "./storage"
  location              = var.location
  storage_account_name  = var.storage_account_name
  tags                  = var.tags
  # Add other storage variables as needed
}

module "datafactory" {
  source                = "./datafactory"
  location              = var.location
  data_factory_name     = var.data_factory_name
  resource_group_name   = module.storage.resource_group_name
  storage_account_id    = module.storage.storage_account_id
  tags                  = var.tags
  # 'depends_on' removed -- not supported due to legacy provider block in module
}

# Optional Synapse Analytics
module "synapse" {
  source                  = "./synapse"
  location                = var.location
  synapse_workspace_name  = var.synapse_workspace_name
  resource_group_name     = module.storage.resource_group_name
  storage_data_lake_id    = module.storage.storage_account_id
  tags                    = var.tags
  # 'count' and 'depends_on' removed -- not supported due to legacy provider block in module
  # Only create if synapse_workspace_name is set: this logic must move inside module.
}
