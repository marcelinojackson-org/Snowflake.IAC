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
  description = "Stage name."
}

variable "url" {
  type        = string
  description = "Stage URL (e.g., s3://bucket/prefix)."
}

variable "comment" {
  type        = string
  default     = null
  description = "Stage comment."
}

variable "storage_integration" {
  type        = string
  default     = null
  description = "Storage integration name."
}

variable "credentials" {
  type        = string
  default     = null
  sensitive   = true
  description = "Stage credentials string (discouraged; prefer storage integration)."
}

variable "file_format" {
  type        = string
  default     = null
  description = "File format string (e.g., FORMAT_NAME = DB.SCHEMA.FORMAT)."
}

variable "copy_options" {
  type        = string
  default     = null
  description = "Copy options string."
}

variable "directory" {
  type        = string
  default     = null
  description = "Directory options string."
}

variable "encryption" {
  type        = string
  default     = null
  description = "Encryption options string."
}
