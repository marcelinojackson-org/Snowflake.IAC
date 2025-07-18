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
  description = "Row access policy name."
}

variable "arguments" {
  type = list(object({
    name = string
    type = string
  }))
  description = "Row access policy arguments."
}

variable "body" {
  type        = string
  description = "Row access policy body SQL."
}

variable "comment" {
  type        = string
  default     = null
  description = "Row access policy comment."
}
