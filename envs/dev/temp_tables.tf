resource "snowflake_execute" "transient_tables" {
  for_each = local.transient_tables

  execute = local.transient_table_sql[each.key].create
  revert  = local.transient_table_sql[each.key].drop

  depends_on = [for mod in module.schemas : mod]
}

resource "snowflake_execute" "temporary_tables" {
  for_each = local.temporary_tables

  execute = local.temporary_table_sql[each.key].create
  revert  = local.temporary_table_sql[each.key].drop

  depends_on = [for mod in module.schemas : mod]
}
