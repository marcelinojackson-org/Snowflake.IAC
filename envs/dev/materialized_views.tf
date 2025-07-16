module "materialized_views" {
  for_each = local.materialized_views
  source   = "../../modules/materialized_view"

  database  = each.value.database
  schema    = each.value.schema
  name      = each.value.name
  warehouse = module.warehouses[each.value.warehouse_key].name
  statement = each.value.statement
  comment   = each.value.comment
}
