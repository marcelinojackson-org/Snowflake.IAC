output "name" {
  value       = snowflake_sequence.this.name
  description = "Sequence name."
}

output "fully_qualified_name" {
  value       = snowflake_sequence.this.fully_qualified_name
  description = "Sequence fully qualified name."
}
