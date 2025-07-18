resource "snowflake_masking_policy" "this" {
  database         = var.database
  schema           = var.schema
  name             = var.name
  body             = var.body
  return_data_type = var.return_data_type
  comment          = var.comment

  dynamic "argument" {
    for_each = var.arguments
    content {
      name = argument.value.name
      type = argument.value.type
    }
  }
}
