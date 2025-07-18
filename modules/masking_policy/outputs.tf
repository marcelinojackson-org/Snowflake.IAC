output "name" {
  value       = snowflake_masking_policy.this.name
  description = "Masking policy name."
}

output "fully_qualified_name" {
  value       = snowflake_masking_policy.this.fully_qualified_name
  description = "Masking policy fully qualified name."
}
