output "name" {
  value       = snowflake_procedure_sql.this.name
  description = "Procedure name."
}

output "fully_qualified_name" {
  value       = snowflake_procedure_sql.this.fully_qualified_name
  description = "Procedure fully qualified name."
}
