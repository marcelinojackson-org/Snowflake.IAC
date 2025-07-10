resource "snowflake_view" "this" {
  database  = var.database
  schema    = var.schema
  name      = var.name
  statement = var.statement
  comment   = var.comment
}
