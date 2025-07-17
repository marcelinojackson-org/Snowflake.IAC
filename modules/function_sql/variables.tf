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
  description = "Function name."
}

variable "arguments" {
  type = list(object({
    arg_name          = string
    arg_data_type     = string
    arg_default_value = optional(string)
  }))
  default     = []
  description = "Function arguments."
}

variable "return_type" {
  type        = string
  description = "Function return type."
}

variable "function_definition" {
  type        = string
  description = "Function SQL definition (no $$)."
}

variable "comment" {
  type        = string
  default     = null
  description = "Function comment."
}
