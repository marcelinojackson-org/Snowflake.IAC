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
  description = "Procedure name."
}

variable "arguments" {
  type = list(object({
    arg_name          = string
    arg_data_type     = string
    arg_default_value = optional(string)
  }))
  default     = []
  description = "Procedure arguments."
}

variable "return_type" {
  type        = string
  description = "Procedure return type."
}

variable "procedure_definition" {
  type        = string
  description = "Procedure SQL definition (no $$)."
}

variable "comment" {
  type        = string
  default     = null
  description = "Procedure comment."
}

variable "execute_as" {
  type        = string
  default     = "CALLER"
  description = "Execute as CALLER or OWNER."
}
