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
