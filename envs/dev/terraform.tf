terraform {
  required_version = ">= 1.5.0"

  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 2.12.0"
    }
  }

  # Remote state is required for real environments.
  # Uncomment ONE backend block below and configure it for your cloud.
  # Do not store local state in this repo.
  #
  # backend "s3" {
  #   bucket         = "myorg-terraform-state"
  #   key            = "snowflake-iac/dev/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "terraform-state-locks"
  #   encrypt        = true
  # }
  #
  # backend "azurerm" {
  #   resource_group_name  = "rg-terraform-state"
  #   storage_account_name = "mystatetfaccount"
  #   container_name       = "tfstate"
  #   key                  = "snowflake-iac/dev/terraform.tfstate"
  # }
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
