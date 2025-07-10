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
  description = "Stream name."
}

variable "table" {
  type        = string
  description = "Fully qualified table name for the stream."
}

variable "append_only" {
  type        = string
  default     = null
  description = "Append-only (true/false/default)."
}

variable "show_initial_rows" {
  type        = string
  default     = null
  description = "Show initial rows (true/false/default)."
}

variable "comment" {
  type        = string
  default     = null
  description = "Stream comment."
}
