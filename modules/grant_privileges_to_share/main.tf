resource "snowflake_grant_privileges_to_share" "this" {
  to_share   = var.to_share
  privileges = var.privileges

  on_database             = var.on_database
  on_schema               = var.on_schema
  on_table                = var.on_table
  on_view                 = var.on_view
  on_all_tables_in_schema = var.on_all_tables_in_schema
}
