resource "snowflake_execute" "iceberg_tables" {
  for_each = local.iceberg_tables

  execute = local.iceberg_table_sql[each.key].create
  revert  = local.iceberg_table_sql[each.key].drop

  depends_on = [for mod in module.schemas : mod]
}

resource "snowflake_execute" "hybrid_tables" {
  for_each = local.hybrid_tables

  execute = local.hybrid_table_sql[each.key].create
  revert  = local.hybrid_table_sql[each.key].drop

  depends_on = [for mod in module.schemas : mod]
}

resource "snowflake_execute" "event_tables" {
  for_each = local.event_tables

  execute = local.event_table_sql[each.key].create
  revert  = local.event_table_sql[each.key].drop

  depends_on = [for mod in module.schemas : mod]
}
