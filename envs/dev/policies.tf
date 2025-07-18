module "masking_policies" {
  for_each = local.masking_policies
  source   = "../../modules/masking_policy"

  database         = each.value.database
  schema           = each.value.schema
  name             = each.value.name
  body             = each.value.body
  return_data_type = each.value.return_data_type
  arguments        = each.value.arguments
  comment          = each.value.comment

  depends_on = [for mod in module.schemas : mod]
}

module "row_access_policies" {
  for_each = local.row_access_policies
  source   = "../../modules/row_access_policy"

  database  = each.value.database
  schema    = each.value.schema
  name      = each.value.name
  body      = each.value.body
  arguments = each.value.arguments
  comment   = each.value.comment

  depends_on = [for mod in module.schemas : mod]
}

module "masking_policy_applications" {
  for_each = local.masking_policy_applications
  source   = "../../modules/table_column_masking_policy_application"

  table          = module.tables[each.value.table_key].fully_qualified_name
  column         = each.value.column
  masking_policy = module.masking_policies[each.value.masking_policy_key].fully_qualified_name

  depends_on = [for mod in module.masking_policies : mod]
}

resource "snowflake_execute" "row_access_policy_applications" {
  for_each = local.row_access_policy_applications

  execute = format(
    "ALTER TABLE %s ADD ROW ACCESS POLICY %s ON (%s)",
    module.tables[each.value.table_key].fully_qualified_name,
    module.row_access_policies[each.value.policy_key].fully_qualified_name,
    join(", ", [for col in each.value.columns : format("\"%s\"", col)])
  )

  revert = format(
    "ALTER TABLE %s DROP ROW ACCESS POLICY %s",
    module.tables[each.value.table_key].fully_qualified_name,
    module.row_access_policies[each.value.policy_key].fully_qualified_name
  )

  depends_on = [for mod in module.row_access_policies : mod]
}
