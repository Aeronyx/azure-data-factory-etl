variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "eastus"
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default     = {}
}

# Storage
variable "storage_account_name" {
  description = "Name for the storage account (must be globally unique, 3-24 lowercase letters/numbers)."
  type        = string
}

# Data Factory
variable "data_factory_name" {
  description = "Name for the Azure Data Factory instance."
  type        = string
}

# Synapse (optional)
variable "synapse_workspace_name" {
  description = "Name for the Synapse Analytics workspace."
  type        = string
  default     = ""
}

# Backend (for remote state)
variable "backend_resource_group_name" {
  description = "Resource group for the Terraform state storage account."
  type        = string
  default     = ""
}
variable "backend_storage_account_name" {
  description = "Storage account for the Terraform state backend."
  type        = string
  default     = ""
}
variable "backend_container_name" {
  description = "Blob container for the Terraform state backend."
  type        = string
  default     = ""
}
variable "backend_key" {
  description = "Key (blob name) for the Terraform state file."
  type        = string
  default     = "terraform.tfstate"
}
