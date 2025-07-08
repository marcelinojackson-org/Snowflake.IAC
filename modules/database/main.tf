resource "snowflake_database" "this" {
  name         = var.name
  comment      = var.comment
  is_transient = var.is_transient
}
