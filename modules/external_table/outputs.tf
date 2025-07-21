output "name" {
  value       = snowflake_external_table.this.name
  description = "External table name."
}

output "fully_qualified_name" {
  value       = snowflake_external_table.this.fully_qualified_name
  description = "External table fully qualified name."
}
