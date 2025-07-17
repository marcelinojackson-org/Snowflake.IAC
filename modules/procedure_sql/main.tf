resource "snowflake_procedure_sql" "this" {
  database             = var.database
  schema               = var.schema
  name                 = var.name
  return_type          = var.return_type
  procedure_definition = var.procedure_definition
  comment              = var.comment
  execute_as           = var.execute_as

  dynamic "arguments" {
    for_each = var.arguments
    content {
      arg_name          = arguments.value.arg_name
      arg_data_type     = arguments.value.arg_data_type
      arg_default_value = try(arguments.value.arg_default_value, null)
    }
  }
}
