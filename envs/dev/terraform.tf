terraform {
  required_version = ">= 1.5.0"

  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 2.12.0"
    }
  }
}

provider "snowflake" {
  account   = var.snowflake_account
  user      = var.snowflake_user
  password  = var.snowflake_password
  role      = var.snowflake_role
  warehouse = var.snowflake_warehouse

  preview_features_enabled = [
    "snowflake_external_table_resource",
    "snowflake_function_sql_resource",
    "snowflake_materialized_view_resource",
    "snowflake_procedure_sql_resource",
    "snowflake_semantic_view_resource",
    "snowflake_share_resource",
    "snowflake_stage_resource",
    "snowflake_table_resource",
    "snowflake_table_column_masking_policy_application_resource",
    "snowflake_sequence_resource",
    "snowflake_dynamic_table_resource",
  ]
}
