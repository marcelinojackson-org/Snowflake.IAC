output "name" {
  value       = snowflake_view.this.name
  description = "View name."
}

output "fully_qualified_name" {
  value       = snowflake_view.this.fully_qualified_name
  description = "View fully qualified name."
}
