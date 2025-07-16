module "semantic_views" {
  for_each = local.semantic_views
  source   = "../../modules/semantic_view"

  database   = each.value.database
  schema     = each.value.schema
  name       = each.value.name
  comment    = each.value.comment
  tables     = each.value.tables
  dimensions = each.value.dimensions
  metrics    = each.value.metrics

  depends_on = [for mod in module.tables : mod]
}
