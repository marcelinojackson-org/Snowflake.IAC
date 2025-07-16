variable "database" {
  type        = string
  description = "Database name."
}

variable "schema" {
  type        = string
  description = "Schema name."
}

variable "name" {
  type        = string
  description = "Materialized view name."
}

variable "warehouse" {
  type        = string
  description = "Warehouse for materialized view refreshes."
}

variable "statement" {
  type        = string
  description = "Materialized view SQL statement."
}

variable "comment" {
  type        = string
  default     = null
  description = "Materialized view comment."
}

variable "is_secure" {
  type        = bool
  default     = false
  description = "Secure view flag."
}

variable "or_replace" {
  type        = bool
  default     = false
  description = "Use CREATE OR REPLACE."
}
