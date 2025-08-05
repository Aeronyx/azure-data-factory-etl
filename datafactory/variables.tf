# Variables for Data Factory Pipelines and Triggers

variable "data_factory_id" {
  description = "The ID of the Azure Data Factory instance."
  type        = string
}

variable "pipeline_names" {
  description = "List of pipeline names to create (for modular extensibility)."
  type        = list(string)
  default     = ["sales_etl", "website_etl"]
}

variable "trigger_frequency" {
  description = "Frequency for schedule triggers (Day or Week)."
  type        = string
  default     = "Day"
}

variable "trigger_interval" {
  description = "Interval for the trigger frequency (1 for nightly, 7 for weekly)."
  type        = number
  default     = 1
}

variable "trigger_start_time" {
  description = "Start time for the trigger in ISO 8601 format (e.g., 2024-01-01T02:00:00Z)."
  type        = string
  default     = "2024-01-01T02:00:00Z"
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default     = {}
}
