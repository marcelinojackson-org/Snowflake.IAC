resource "snowflake_stage" "this" {
  database = var.database
  schema   = var.schema
  name     = var.name
  url      = var.url
  comment  = var.comment

  storage_integration = var.storage_integration
  credentials         = var.credentials
  file_format         = var.file_format
  copy_options        = var.copy_options
  directory           = var.directory
  encryption          = var.encryption
}
