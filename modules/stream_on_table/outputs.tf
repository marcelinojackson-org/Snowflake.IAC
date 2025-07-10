output "name" {
  value       = snowflake_stream_on_table.this.name
  description = "Stream name."
}

output "fully_qualified_name" {
  value       = snowflake_stream_on_table.this.fully_qualified_name
  description = "Stream fully qualified name."
}
