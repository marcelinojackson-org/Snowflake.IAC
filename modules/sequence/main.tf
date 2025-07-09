resource "snowflake_sequence" "this" {
  database  = var.database
  schema    = var.schema
  name      = var.name
  comment   = var.comment
  increment = var.increment
  ordering  = var.ordering
}
