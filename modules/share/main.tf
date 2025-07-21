resource "snowflake_share" "this" {
  name     = var.name
  comment  = var.comment
  accounts = var.accounts
}
