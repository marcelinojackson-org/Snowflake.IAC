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
  description = "Semantic view name."
}

variable "comment" {
  type        = string
  default     = null
  description = "Semantic view comment."
}

variable "tables" {
  type = list(object({
    table_alias = string
    table_name  = string
    comment     = optional(string)
    primary_key = optional(list(string))
    synonym     = optional(list(string))
    unique      = optional(list(list(string)))
  }))
  description = "Logical tables for the semantic view."
}

variable "dimensions" {
  type = list(object({
    qualified_expression_name = string
    sql_expression            = string
    comment                   = optional(string)
    synonym                   = optional(list(string))
  }))
  default     = []
  description = "Dimensions for the semantic view."
}

variable "metrics" {
  type = list(object({
    qualified_expression_name = string
    sql_expression            = string
    comment                   = optional(string)
    synonym                   = optional(list(string))
  }))
  default     = []
  description = "Metrics for the semantic view (semantic expressions)."
}
