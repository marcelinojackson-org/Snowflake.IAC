variable "table" {
  type        = string
  description = "Fully qualified table name."
}

variable "column" {
  type        = string
  description = "Column name."
}

variable "masking_policy" {
  type        = string
  description = "Fully qualified masking policy name."
}
