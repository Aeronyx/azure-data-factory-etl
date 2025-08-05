# Required variables for deployment
location               = "eastus2"
storage_account_name   = "uniquestorage1234"         # <-- Replace with a globally unique lowercase name

# Data Factory
# Use a valid, unique name per ADF requirements
# https://docs.microsoft.com/en-us/azure/data-factory/data-factory-naming-rules
data_factory_name      = "sales-web-adf"

# Optional Synapse
synapse_workspace_name = "sales-analytics-workspace"  # Or leave as "" if not using

tags = {
  environment = "dev"
  project     = "sales-website-etl"
}

# Backend config (if using remote state, otherwise ignore)
backend_resource_group_name   = "state-rg"      # Optional: backend state
backend_storage_account_name  = "tfstatestore123" # Optional: backend state
backend_container_name        = "tfstate"
backend_key                  = "terraform.tfstate"
