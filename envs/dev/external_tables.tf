module "external_tables" {
  for_each = local.external_tables
  source   = "../../modules/external_table"

  database    = each.value.database
  schema      = each.value.schema
  name        = each.value.name
  location    = each.value.location
  file_format = each.value.file_format
  columns     = each.value.columns
  comment     = each.value.comment
  pattern     = each.value.pattern

  depends_on = [for mod in module.stages : mod]
}
