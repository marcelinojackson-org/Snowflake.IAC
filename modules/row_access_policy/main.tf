resource "snowflake_row_access_policy" "this" {
  database = var.database
  schema   = var.schema
  name     = var.name
  body     = var.body
  comment  = var.comment

  dynamic "argument" {
    for_each = var.arguments
    content {
      name = argument.value.name
      type = argument.value.type
    }
  }
}
