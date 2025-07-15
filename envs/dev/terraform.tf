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
    "snowflake_stage_resource",
    "snowflake_table_resource",
    "snowflake_sequence_resource",
    "snowflake_dynamic_table_resource",
  ]
}
