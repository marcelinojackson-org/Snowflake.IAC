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
  description = "View name."
}

variable "statement" {
  type        = string
  description = "View SQL statement."
}

variable "comment" {
  type        = string
  default     = null
  description = "View comment."
}
