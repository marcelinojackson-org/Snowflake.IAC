output "name" {
  value       = snowflake_semantic_view.this.name
  description = "Semantic view name."
}

output "fully_qualified_name" {
  value       = snowflake_semantic_view.this.fully_qualified_name
  description = "Semantic view fully qualified name."
}
