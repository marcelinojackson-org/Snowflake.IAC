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
  description = "Task name."
}

variable "warehouse" {
  type        = string
  description = "Warehouse for task execution."
}

variable "sql_statement" {
  type        = string
  description = "SQL statement to run."
}

variable "started" {
  type        = bool
  default     = true
  description = "Whether the task is started."
}

variable "schedule_minutes" {
  type        = number
  description = "Schedule interval in minutes."
}

variable "comment" {
  type        = string
  default     = null
  description = "Task comment."
}
