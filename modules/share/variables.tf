variable "name" {
  type        = string
  description = "Share name."
}

variable "comment" {
  type        = string
  default     = null
  description = "Share comment."
}

variable "accounts" {
  type        = list(string)
  default     = []
  description = "Consumer accounts (organization.account)."
}
