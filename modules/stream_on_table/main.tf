resource "snowflake_stream_on_table" "this" {
  database = var.database
  schema   = var.schema
  name     = var.name
  table    = var.table

  append_only       = var.append_only
  show_initial_rows = var.show_initial_rows
  comment           = var.comment
}
