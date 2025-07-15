output "name" {
  value       = snowflake_stage.this.name
  description = "Stage name."
}

output "fully_qualified_name" {
  value       = snowflake_stage.this.fully_qualified_name
  description = "Stage fully qualified name."
}
