resource "snowflake_external_table" "this" {
  database     = var.database
  schema       = var.schema
  name         = var.name
  location     = var.location
  file_format  = var.file_format
  comment      = var.comment
  pattern      = var.pattern
  auto_refresh = var.auto_refresh

  dynamic "column" {
    for_each = var.columns
    content {
      name = column.value.name
      type = column.value.type
      as   = column.value.as
    }
  }
}
