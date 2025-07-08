output "name" {
  value       = snowflake_database.this.name
  description = "Database name."
}

output "fully_qualified_name" {
  value       = snowflake_database.this.fully_qualified_name
  description = "Database fully qualified name."
}
