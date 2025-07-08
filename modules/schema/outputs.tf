output "name" {
  value       = snowflake_schema.this.name
  description = "Schema name."
}

output "fully_qualified_name" {
  value       = snowflake_schema.this.fully_qualified_name
  description = "Schema fully qualified name."
}
