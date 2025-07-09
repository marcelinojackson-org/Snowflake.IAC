output "name" {
  value       = snowflake_table.this.name
  description = "Table name."
}

output "fully_qualified_name" {
  value       = snowflake_table.this.fully_qualified_name
  description = "Table fully qualified name."
}
