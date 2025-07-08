variable "name" {
  type        = string
  description = "Warehouse name."
}

variable "warehouse_size" {
  type        = string
  default     = "SMALL"
  description = "Warehouse size."
}

variable "warehouse_type" {
  type        = string
  default     = "STANDARD"
  description = "Warehouse type (STANDARD or SNOWPARK-OPTIMIZED)."
}

variable "auto_suspend" {
  type        = number
  default     = 300
  description = "Auto-suspend in seconds."
}

variable "auto_resume" {
  type        = string
  default     = "true"
  description = "Auto-resume (true/false)."
}

variable "initially_suspended" {
  type        = bool
  default     = true
  description = "Create warehouse suspended."
}

variable "comment" {
  type        = string
  default     = null
  description = "Warehouse comment."
}

variable "min_cluster_count" {
  type        = number
  default     = null
  description = "Minimum clusters for multi-cluster warehouses."
}

variable "max_cluster_count" {
  type        = number
  default     = null
  description = "Maximum clusters for multi-cluster warehouses."
}

variable "scaling_policy" {
  type        = string
  default     = null
  description = "Scaling policy (STANDARD/ECONOMY)."
}
