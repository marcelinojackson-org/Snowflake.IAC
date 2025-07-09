module "sequences" {
  for_each = local.sequences
  source   = "../../modules/sequence"

  database = each.value.database
  schema   = each.value.schema
  name     = each.value.name
  comment  = each.value.comment

  depends_on = [for mod in module.schemas : mod]
}

module "tables" {
  for_each = local.tables
  source   = "../../modules/table"

  database = each.value.database
  schema   = each.value.schema
  name     = each.value.name
  comment  = each.value.comment

  columns = [
    for col in each.value.columns : {
      name             = col.name
      type             = col.type
      nullable         = try(col.nullable, true)
      comment          = try(col.comment, null)
      default_sequence = try(module.sequences[col.default_sequence_key].fully_qualified_name, null)
    }
  ]

  depends_on = [for mod in module.schemas : mod]
}
