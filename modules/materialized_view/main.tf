resource "snowflake_materialized_view" "this" {
  database   = var.database
  schema     = var.schema
  name       = var.name
  warehouse  = var.warehouse
  statement  = var.statement
  comment    = var.comment
  is_secure  = var.is_secure
  or_replace = var.or_replace
}
