module "shares" {
  for_each = local.shares
  source   = "../../modules/share"

  name     = each.value.name
  comment  = each.value.comment
  accounts = each.value.accounts
}

module "share_grants" {
  for_each = local.share_grants
  source   = "../../modules/grant_privileges_to_share"

  to_share                = each.value.to_share
  privileges              = toset(each.value.privileges)
  on_database             = try(each.value.on_database, null)
  on_schema               = try(each.value.on_schema, null)
  on_table                = try(each.value.on_table, null)
  on_view                 = try(each.value.on_view, null)
  on_all_tables_in_schema = try(each.value.on_all_tables_in_schema, null)

  depends_on = [for mod in module.shares : mod]
}
