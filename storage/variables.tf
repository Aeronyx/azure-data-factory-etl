variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique name for the Storage Account. Must be 3-24 lowercase letters and numbers."
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}

variable "enable_private_endpoints" {
  description = "Whether to enable private endpoints for the storage account."
  type        = bool
  default     = false
}

variable "private_endpoint_subnet_id" {
  description = "Subnet resource ID for the private endpoint (if enabled)."
  type        = string
  default     = null
}

variable "network_rules" {
  description = "Network rules for the storage account. Set to null to allow all."
  type = object({
    bypass                     = optional(set(string), ["AzureServices"])
    defaultaction              = optional(string, "Deny")
    iprules                    = optional(set(string), [])
    virtualnetworksubnetids    = optional(set(string), [])
    privatelinkaccess          = optional(list(object({
      endpointresourceid = string
      endpointtenantid   = optional(string)
    })), [])
  })
  default = null
}
