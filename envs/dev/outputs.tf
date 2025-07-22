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

output "stage_names" {
  value       = [for key, mod in module.stages : mod.fully_qualified_name]
  description = "Fully qualified stage names."
}

output "materialized_view_names" {
  value       = [for key, mod in module.materialized_views : mod.fully_qualified_name]
  description = "Fully qualified materialized view names."
}

output "semantic_view_names" {
  value       = [for key, mod in module.semantic_views : mod.fully_qualified_name]
  description = "Fully qualified semantic view names."
}

output "task_names" {
  value       = [for key, mod in module.tasks : mod.fully_qualified_name]
  description = "Fully qualified task names."
}

output "function_names" {
  value       = [for key, mod in module.functions : mod.fully_qualified_name]
  description = "Fully qualified function names."
}

output "procedure_names" {
  value       = [for key, mod in module.procedures : mod.fully_qualified_name]
  description = "Fully qualified procedure names."
}

output "masking_policy_names" {
  value       = [for key, mod in module.masking_policies : mod.fully_qualified_name]
  description = "Fully qualified masking policy names."
}

output "row_access_policy_names" {
  value       = [for key, mod in module.row_access_policies : mod.fully_qualified_name]
  description = "Fully qualified row access policy names."
}

output "external_table_names" {
  value       = [for key, mod in module.external_tables : mod.fully_qualified_name]
  description = "Fully qualified external table names."
}

output "share_names" {
  value       = [for key, mod in module.shares : mod.fully_qualified_name]
  description = "Fully qualified share names."
}

output "iceberg_table_names" {
  value = [
    for key, table_def in local.iceberg_tables :
    format("\"%s\".\"%s\".\"%s\"", table_def.database, table_def.schema, table_def.name)
  ]
  description = "Iceberg table names."
}

output "hybrid_table_names" {
  value = [
    for key, table_def in local.hybrid_tables :
    format("\"%s\".\"%s\".\"%s\"", table_def.database, table_def.schema, table_def.name)
  ]
  description = "Hybrid table names."
}

output "event_table_names" {
  value = [
    for key, table_def in local.event_tables :
    format("\"%s\".\"%s\".\"%s\"", table_def.database, table_def.schema, table_def.name)
  ]
  description = "Event table names."
}
