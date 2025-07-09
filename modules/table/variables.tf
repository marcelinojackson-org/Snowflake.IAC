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
  description = "Table name."
}

variable "comment" {
  type        = string
  default     = null
  description = "Table comment."
}

variable "columns" {
  type = list(object({
    name             = string
    type             = string
    nullable         = optional(bool, true)
    comment          = optional(string)
    default_sequence = optional(string)
  }))
  description = "Column definitions."
}
