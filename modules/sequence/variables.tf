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
  description = "Sequence name."
}

variable "comment" {
  type        = string
  default     = null
  description = "Sequence comment."
}

variable "increment" {
  type        = number
  default     = 1
  description = "Sequence increment."
}

variable "ordering" {
  type        = string
  default     = "ORDER"
  description = "Sequence ordering (ORDER/NOORDER)."
}
