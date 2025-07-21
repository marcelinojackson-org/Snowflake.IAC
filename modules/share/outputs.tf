output "name" {
  value       = snowflake_share.this.name
  description = "Share name."
}

output "fully_qualified_name" {
  value       = snowflake_share.this.fully_qualified_name
  description = "Share fully qualified name."
}
