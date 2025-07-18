resource "snowflake_table_column_masking_policy_application" "this" {
  table          = var.table
  column         = var.column
  masking_policy = var.masking_policy
}
