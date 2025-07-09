resource "snowflake_table" "this" {
  database = var.database
  schema   = var.schema
  name     = var.name
  comment  = var.comment

  dynamic "column" {
    for_each = var.columns
    content {
      name     = column.value.name
      type     = column.value.type
      nullable = try(column.value.nullable, true)
      comment  = try(column.value.comment, null)

      dynamic "default" {
        for_each = try(column.value.default_sequence, null) != null ? [column.value.default_sequence] : []
        content {
          sequence = default.value
        }
      }
    }
  }
}
