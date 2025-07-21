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
  description = "External table name."
}

variable "location" {
  type        = string
  description = "Stage location (e.g., @DB.SCHEMA.STAGE)."
}

variable "file_format" {
  type        = string
  description = "File format string."
}

variable "columns" {
  type = list(object({
    name = string
    type = string
    as   = string
  }))
  description = "External table columns with AS expressions."
}

variable "comment" {
  type        = string
  default     = null
  description = "External table comment."
}

variable "pattern" {
  type        = string
  default     = null
  description = "File pattern filter."
}

variable "auto_refresh" {
  type        = bool
  default     = true
  description = "Auto refresh metadata."
}
