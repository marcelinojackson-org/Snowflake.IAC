output "warehouse_names" {
  value       = [for key, mod in module.warehouses : mod.name]
  description = "Warehouse names."
}

output "database_names" {
  value       = [for key, mod in module.databases : mod.name]
  description = "Database names."
}

output "table_names" {
  value       = [for key, mod in module.tables : mod.fully_qualified_name]
  description = "Fully qualified table names."
}

output "view_names" {
  value       = [for key, mod in module.views : mod.fully_qualified_name]
  description = "Fully qualified view names."
}

output "dynamic_table_names" {
  value       = [for key, mod in module.dynamic_tables : mod.fully_qualified_name]
  description = "Fully qualified dynamic table names."
}
