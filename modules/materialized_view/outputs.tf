output "name" {
  value       = snowflake_materialized_view.this.name
  description = "Materialized view name."
}

output "fully_qualified_name" {
  value       = snowflake_materialized_view.this.fully_qualified_name
  description = "Materialized view fully qualified name."
}
