# Variables for Synapse Analytics Workspace

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Synapse workspace."
  type        = string
}

variable "location" {
  description = "The Azure region where the Synapse workspace will be created."
  type        = string
}

variable "synapse_workspace_name" {
  description = "The name of the Synapse workspace."
  type        = string
}

variable "storage_data_lake_gen2_filesystem_id" {
  description = "The ID of the Data Lake Gen2 filesystem to associate with the Synapse workspace."
  type        = string
}

variable "sql_administrator_login" {
  description = "The SQL administrator login name for the Synapse workspace."
  type        = string
  sensitive   = true
}

variable "sql_administrator_login_password" {
  description = "The SQL administrator login password for the Synapse workspace."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "A map of tags to assign to the Synapse workspace."
  type        = map(string)
  default     = {}
}
