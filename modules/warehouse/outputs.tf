output "name" {
  value       = snowflake_warehouse.this.name
  description = "Warehouse name."
}

output "fully_qualified_name" {
  value       = snowflake_warehouse.this.fully_qualified_name
  description = "Warehouse fully qualified name."
}
