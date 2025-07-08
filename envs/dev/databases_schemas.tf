module "databases" {
  for_each = local.databases
  source   = "../../modules/database"

  name         = each.key
  comment      = each.value.comment
  is_transient = try(each.value.is_transient, false)
}

module "schemas" {
  for_each = local.schemas
  source   = "../../modules/schema"

  database     = each.value.database
  name         = each.value.name
  comment      = each.value.comment
  is_transient = try(each.value.is_transient, null)

  depends_on = [for mod in module.databases : mod]
}
