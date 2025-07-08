resource "snowflake_warehouse" "this" {
  name                = var.name
  warehouse_size      = var.warehouse_size
  warehouse_type      = var.warehouse_type
  auto_suspend        = var.auto_suspend
  auto_resume         = var.auto_resume
  initially_suspended = var.initially_suspended
  comment             = var.comment

  min_cluster_count = var.min_cluster_count
  max_cluster_count = var.max_cluster_count
  scaling_policy    = var.scaling_policy
}
