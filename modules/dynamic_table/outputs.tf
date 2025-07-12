output "name" {
  value       = snowflake_dynamic_table.this.name
  description = "Dynamic table name."
}

output "fully_qualified_name" {
  value       = snowflake_dynamic_table.this.fully_qualified_name
  description = "Dynamic table fully qualified name."
}
