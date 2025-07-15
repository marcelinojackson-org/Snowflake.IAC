module "stages" {
  for_each = local.stages
  source   = "../../modules/stage"

  database = each.value.database
  schema   = each.value.schema
  name     = each.value.name
  url      = each.value.url
  comment  = each.value.comment

  storage_integration = var.stage_storage_integration

  depends_on = [for mod in module.schemas : mod]
}
