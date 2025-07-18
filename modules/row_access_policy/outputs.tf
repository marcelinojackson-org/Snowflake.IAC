output "name" {
  value       = snowflake_row_access_policy.this.name
  description = "Row access policy name."
}

output "fully_qualified_name" {
  value       = snowflake_row_access_policy.this.fully_qualified_name
  description = "Row access policy fully qualified name."
}
