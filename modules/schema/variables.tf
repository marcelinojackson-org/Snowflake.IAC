variable "database" {
  type        = string
  description = "Database name."
}

variable "name" {
  type        = string
  description = "Schema name."
}

variable "comment" {
  type        = string
  default     = null
  description = "Schema comment."
}

variable "is_transient" {
  type        = string
  default     = null
  description = "Whether the schema is transient (true/false/default)."
}
