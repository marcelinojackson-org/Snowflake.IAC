resource "snowflake_task" "this" {
  database      = var.database
  schema        = var.schema
  name          = var.name
  warehouse     = var.warehouse
  sql_statement = var.sql_statement
  started       = var.started
  comment       = var.comment

  schedule {
    minutes = var.schedule_minutes
  }
}
