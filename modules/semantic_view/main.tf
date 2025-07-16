resource "snowflake_semantic_view" "this" {
  database = var.database
  schema   = var.schema
  name     = var.name
  comment  = var.comment

  dynamic "tables" {
    for_each = var.tables
    content {
      table_alias = tables.value.table_alias
      table_name  = tables.value.table_name
      comment     = try(tables.value.comment, null)
      primary_key = try(tables.value.primary_key, null)
      synonym     = try(tables.value.synonym, null)

      dynamic "unique" {
        for_each = try(tables.value.unique, [])
        content {
          values = unique.value
        }
      }
    }
  }

  dynamic "dimensions" {
    for_each = var.dimensions
    content {
      qualified_expression_name = dimensions.value.qualified_expression_name
      sql_expression            = dimensions.value.sql_expression
      comment                   = try(dimensions.value.comment, null)
      synonym                   = try(dimensions.value.synonym, null)
    }
  }

  dynamic "metrics" {
    for_each = var.metrics
    content {
      semantic_expression {
        qualified_expression_name = metrics.value.qualified_expression_name
        sql_expression            = metrics.value.sql_expression
        comment                   = try(metrics.value.comment, null)
        synonym                   = try(metrics.value.synonym, null)
      }
    }
  }
}
