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
  description = "Dynamic table name."
}

variable "query" {
  type        = string
  description = "Dynamic table query."
}

variable "warehouse" {
  type        = string
  description = "Warehouse used for refresh."
}

variable "target_lag_maximum_duration" {
  type        = string
  description = "Maximum target lag (e.g., '20 minutes')."
}

variable "comment" {
  type        = string
  default     = null
  description = "Dynamic table comment."
}

variable "refresh_mode" {
  type        = string
  default     = null
  description = "Refresh mode (AUTO/INCREMENTAL/FULL)."
}

variable "initialize" {
  type        = string
  default     = null
  description = "Initialize mode (ON_CREATE/ON_SCHEDULE)."
}

variable "or_replace" {
  type        = bool
  default     = false
  description = "Replace if exists."
}
