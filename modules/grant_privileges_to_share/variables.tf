variable "to_share" {
  type        = string
  description = "Share name or fully qualified name."
}

variable "privileges" {
  type        = set(string)
  description = "Privileges to grant."
}

variable "on_database" {
  type        = string
  default     = null
  description = "Database to grant on."
}

variable "on_schema" {
  type        = string
  default     = null
  description = "Schema to grant on."
}

variable "on_table" {
  type        = string
  default     = null
  description = "Table to grant on."
}

variable "on_view" {
  type        = string
  default     = null
  description = "View to grant on."
}

variable "on_all_tables_in_schema" {
  type        = string
  default     = null
  description = "Grant on all tables in schema."
}
