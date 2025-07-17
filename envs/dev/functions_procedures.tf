module "functions" {
  for_each = local.functions
  source   = "../../modules/function_sql"

  database            = each.value.database
  schema              = each.value.schema
  name                = each.value.name
  return_type         = each.value.return_type
  function_definition = each.value.function_definition
  arguments           = each.value.arguments
  comment             = each.value.comment

  depends_on = [for mod in module.schemas : mod]
}

module "procedures" {
  for_each = local.procedures
  source   = "../../modules/procedure_sql"

  database             = each.value.database
  schema               = each.value.schema
  name                 = each.value.name
  return_type          = each.value.return_type
  procedure_definition = each.value.procedure_definition
  arguments            = each.value.arguments
  comment              = each.value.comment
  execute_as           = each.value.execute_as

  depends_on = [snowflake_execute.transient_tables]
}
