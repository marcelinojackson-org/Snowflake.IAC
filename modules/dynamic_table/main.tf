resource "snowflake_dynamic_table" "this" {
  database  = var.database
  schema    = var.schema
  name      = var.name
  query     = var.query
  warehouse = var.warehouse
  comment   = var.comment

  target_lag {
    maximum_duration = var.target_lag_maximum_duration
  }

  refresh_mode = var.refresh_mode
  initialize   = var.initialize
  or_replace   = var.or_replace
}
