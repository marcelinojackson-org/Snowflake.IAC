locals {
  iceberg_tables = {
    "HR.ICEBERG_EMPLOYEES" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "ICEBERG_EMPLOYEES"
      columns = [
        "EMPLOYEE_ID NUMBER",
        "EMPLOYEE_NUMBER STRING",
        "FIRST_NAME STRING",
        "LAST_NAME STRING",
        "EMAIL STRING",
        "HIRE_DATE DATE",
        "JOB_TITLE STRING",
        "DEPARTMENT_ID NUMBER",
        "EMPLOYMENT_STATUS STRING",
        "BASE_SALARY NUMBER(18,2)",
        "SALARY_CURRENCY STRING"
      ]
    }
    "FINANCE.ICEBERG_TRANSACTIONS" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "ICEBERG_TRANSACTIONS"
      columns = [
        "TRANSACTION_ID NUMBER",
        "ACCOUNT_ID NUMBER",
        "TRANSACTION_DATE DATE",
        "POSTED_TS TIMESTAMP_NTZ",
        "DESCRIPTION STRING",
        "AMOUNT NUMBER(18,2)",
        "CURRENCY STRING",
        "STATUS STRING"
      ]
    }
  }

  iceberg_table_sql = {
    for key, table_def in local.iceberg_tables :
    key => {
      create = format(
        "CREATE ICEBERG TABLE IF NOT EXISTS \"%s\".\"%s\".\"%s\" (\n  %s\n) CATALOG = 'SNOWFLAKE' EXTERNAL_VOLUME = '%s' BASE_LOCATION = '%s/%s/%s/'",
        table_def.database,
        table_def.schema,
        table_def.name,
        join(",\n  ", table_def.columns),
        var.iceberg_external_volume,
        var.iceberg_base_location_prefix,
        lower(table_def.database),
        lower(table_def.name)
      )
      drop = format(
        "DROP TABLE IF EXISTS \"%s\".\"%s\".\"%s\"",
        table_def.database,
        table_def.schema,
        table_def.name
      )
    }
  }

  hybrid_tables = {
    "HR.HYBRID_EMPLOYEE_DIM" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "HYBRID_EMPLOYEE_DIM"
      columns = [
        "EMPLOYEE_ID NUMBER NOT NULL",
        "FULL_NAME STRING",
        "EMAIL STRING",
        "DEPARTMENT_ID NUMBER",
        "JOB_TITLE STRING",
        "EMPLOYMENT_STATUS STRING",
        "UPDATED_AT TIMESTAMP_NTZ",
        "PRIMARY KEY (EMPLOYEE_ID)"
      ]
    }
    "FINANCE.HYBRID_ACCOUNT_DIM" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "HYBRID_ACCOUNT_DIM"
      columns = [
        "ACCOUNT_ID NUMBER NOT NULL",
        "ACCOUNT_NAME STRING",
        "ACCOUNT_TYPE STRING",
        "STATUS STRING",
        "UPDATED_AT TIMESTAMP_NTZ",
        "PRIMARY KEY (ACCOUNT_ID)"
      ]
    }
  }

  hybrid_table_sql = {
    for key, table_def in local.hybrid_tables :
    key => {
      create = format(
        "CREATE HYBRID TABLE IF NOT EXISTS \"%s\".\"%s\".\"%s\" (\n  %s\n)",
        table_def.database,
        table_def.schema,
        table_def.name,
        join(",\n  ", table_def.columns)
      )
      drop = format(
        "DROP TABLE IF EXISTS \"%s\".\"%s\".\"%s\"",
        table_def.database,
        table_def.schema,
        table_def.name
      )
    }
  }

  event_tables = {
    "HR.EVENTS" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "EVENTS"
    }
    "FINANCE.EVENTS" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "EVENTS"
    }
  }

  event_table_sql = {
    for key, table_def in local.event_tables :
    key => {
      create = format(
        "CREATE EVENT TABLE IF NOT EXISTS \"%s\".\"%s\".\"%s\"",
        table_def.database,
        table_def.schema,
        table_def.name
      )
      drop = format(
        "DROP TABLE IF EXISTS \"%s\".\"%s\".\"%s\"",
        table_def.database,
        table_def.schema,
        table_def.name
      )
    }
  }
}
