variable "name" {
  type        = string
  description = "Database name."
}

variable "comment" {
  type        = string
  default     = null
  description = "Database comment."
}

variable "is_transient" {
  type        = bool
  default     = false
  description = "Whether the database is transient."
}
