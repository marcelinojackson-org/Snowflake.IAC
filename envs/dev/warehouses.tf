module "warehouses" {
  for_each = local.warehouses
  source   = "../../modules/warehouse"

  name                = each.key
  warehouse_size      = each.value.warehouse_size
  auto_suspend        = each.value.auto_suspend
  auto_resume         = each.value.auto_resume
  comment             = each.value.comment
  warehouse_type      = try(each.value.warehouse_type, "STANDARD")
  min_cluster_count   = try(each.value.min_cluster_count, null)
  max_cluster_count   = try(each.value.max_cluster_count, null)
  scaling_policy      = try(each.value.scaling_policy, null)
  initially_suspended = true
}
