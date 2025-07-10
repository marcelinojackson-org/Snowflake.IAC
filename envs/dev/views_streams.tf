module "views" {
  for_each = local.views
  source   = "../../modules/view"

  database  = each.value.database
  schema    = each.value.schema
  name      = each.value.name
  statement = each.value.statement
  comment   = each.value.comment

  depends_on = [for mod in module.tables : mod]
}

module "streams" {
  for_each = local.streams
  source   = "../../modules/stream_on_table"

  database          = each.value.database
  schema            = each.value.schema
  name              = each.value.name
  table             = module.tables[each.value.table_key].fully_qualified_name
  append_only       = each.value.append_only
  show_initial_rows = each.value.show_initial_rows
  comment           = each.value.comment

  depends_on = [for mod in module.tables : mod]
}
