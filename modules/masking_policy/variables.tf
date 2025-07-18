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
  description = "Masking policy name."
}

variable "arguments" {
  type = list(object({
    name = string
    type = string
  }))
  description = "Masking policy arguments."
}

variable "body" {
  type        = string
  description = "Masking policy body SQL."
}

variable "return_data_type" {
  type        = string
  description = "Return data type."
}

variable "comment" {
  type        = string
  default     = null
  description = "Masking policy comment."
}
