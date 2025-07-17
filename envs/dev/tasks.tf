module "tasks" {
  for_each = local.tasks
  source   = "../../modules/task"

  database         = each.value.database
  schema           = each.value.schema
  name             = each.value.name
  warehouse        = module.warehouses[each.value.warehouse_key].name
  sql_statement    = each.value.sql_statement
  schedule_minutes = each.value.schedule_minutes
  comment          = each.value.comment

  depends_on = [for mod in module.procedures : mod]
}
