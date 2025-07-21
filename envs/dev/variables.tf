variable "snowflake_account" {
  type        = string
  description = "Snowflake account identifier (e.g., org-account)."
}

variable "snowflake_user" {
  type        = string
  description = "Snowflake user."
}

variable "snowflake_password" {
  type        = string
  sensitive   = true
  description = "Snowflake password."
}

variable "snowflake_role" {
  type        = string
  description = "Snowflake role to use for provisioning."
}

variable "snowflake_warehouse" {
  type        = string
  default     = "COMPUTE_WH"
  description = "Warehouse to use for provider operations (bootstrap warehouse)."
}

variable "stage_storage_integration" {
  type        = string
  default     = null
  description = "Snowflake storage integration for external stages."
}

variable "stage_bucket_raw" {
  type        = string
  description = "S3 bucket name for the raw stage."
}

variable "stage_bucket_silver" {
  type        = string
  description = "S3 bucket name for the silver stage."
}

variable "stage_bucket_gold" {
  type        = string
  description = "S3 bucket name for the gold stage."
}

variable "share_accounts" {
  type        = map(list(string))
  default     = {}
  description = "Map of share name to consumer accounts (organization.account)."
}

variable "iceberg_external_volume" {
  type        = string
  description = "External volume name for Iceberg tables."
}

variable "iceberg_base_location_prefix" {
  type        = string
  default     = "iceberg"
  description = "Base location prefix for Iceberg tables within the external volume."
}
