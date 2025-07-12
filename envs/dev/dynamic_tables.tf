module "dynamic_tables" {
  for_each = local.dynamic_tables
  source   = "../../modules/dynamic_table"

  database                    = each.value.database
  schema                      = each.value.schema
  name                        = each.value.name
  query                       = each.value.query
  warehouse                   = module.warehouses[each.value.warehouse_key].name
  target_lag_maximum_duration = each.value.target_lag_maximum_duration
  comment                     = each.value.comment

  depends_on = [for mod in module.tables : mod]
}
