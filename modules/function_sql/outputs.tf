output "name" {
  value       = snowflake_function_sql.this.name
  description = "Function name."
}

output "fully_qualified_name" {
  value       = snowflake_function_sql.this.fully_qualified_name
  description = "Function fully qualified name."
}
