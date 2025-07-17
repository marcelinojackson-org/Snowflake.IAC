output "name" {
  value       = snowflake_task.this.name
  description = "Task name."
}

output "fully_qualified_name" {
  value       = snowflake_task.this.fully_qualified_name
  description = "Task fully qualified name."
}
