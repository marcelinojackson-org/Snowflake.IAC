locals {
  transient_tables = {
    "HR.TRN_EMPLOYEE_EVENTS" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "TRN_EMPLOYEE_EVENTS"
      columns = [
        { name = "EVENT_ID", type = "NUMBER(38,0)" },
        { name = "EMPLOYEE_ID", type = "NUMBER(38,0)" },
        { name = "EVENT_TYPE", type = "VARCHAR(100)" },
        { name = "EVENT_TS", type = "TIMESTAMP_NTZ" },
        { name = "SOURCE_SYSTEM", type = "VARCHAR(50)" },
        { name = "EVENT_PAYLOAD", type = "VARIANT" }
      ]
    }
    "HR.TRN_BENEFIT_ENROLLMENTS" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "TRN_BENEFIT_ENROLLMENTS"
      columns = [
        { name = "ENROLLMENT_ID", type = "NUMBER(38,0)" },
        { name = "EMPLOYEE_ID", type = "NUMBER(38,0)" },
        { name = "BENEFIT_ID", type = "NUMBER(38,0)" },
        { name = "PLAN_CODE", type = "VARCHAR(50)" },
        { name = "EFFECTIVE_DATE", type = "DATE" },
        { name = "ENROLLMENT_STATUS", type = "VARCHAR(30)" },
        { name = "CREATED_AT", type = "TIMESTAMP_NTZ" }
      ]
    }
    "FINANCE.TRN_PAYMENT_EVENTS" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "TRN_PAYMENT_EVENTS"
      columns = [
        { name = "PAYMENT_EVENT_ID", type = "NUMBER(38,0)" },
        { name = "PAYMENT_ID", type = "NUMBER(38,0)" },
        { name = "EVENT_TYPE", type = "VARCHAR(50)" },
        { name = "EVENT_TS", type = "TIMESTAMP_NTZ" },
        { name = "AMOUNT", type = "NUMBER(18,2)" },
        { name = "STATUS", type = "VARCHAR(20)" }
      ]
    }
    "FINANCE.TRN_GL_STAGING" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "TRN_GL_STAGING"
      columns = [
        { name = "ENTRY_ID", type = "NUMBER(38,0)" },
        { name = "JOURNAL_ID", type = "VARCHAR(40)" },
        { name = "ACCOUNT_ID", type = "NUMBER(38,0)" },
        { name = "GL_ACCOUNT", type = "VARCHAR(20)" },
        { name = "AMOUNT", type = "NUMBER(18,2)" },
        { name = "POSTED_DATE", type = "DATE" },
        { name = "DESCRIPTION", type = "VARCHAR(200)" }
      ]
    }
    "MARKETING.TRN_LEAD_EVENTS" = {
      database = "MARKETING"
      schema   = "PUBLIC"
      name     = "TRN_LEAD_EVENTS"
      columns = [
        { name = "LEAD_EVENT_ID", type = "NUMBER(38,0)" },
        { name = "LEAD_ID", type = "NUMBER(38,0)" },
        { name = "EVENT_TYPE", type = "VARCHAR(50)" },
        { name = "EVENT_TS", type = "TIMESTAMP_NTZ" },
        { name = "SOURCE", type = "VARCHAR(50)" },
        { name = "SCORE", type = "NUMBER(5,2)" },
        { name = "EVENT_PAYLOAD", type = "VARIANT" }
      ]
    }
    "MARKETING.TRN_ATTRIBUTION_EVENTS" = {
      database = "MARKETING"
      schema   = "PUBLIC"
      name     = "TRN_ATTRIBUTION_EVENTS"
      columns = [
        { name = "ATTRIBUTION_ID", type = "NUMBER(38,0)" },
        { name = "CAMPAIGN_ID", type = "NUMBER(38,0)" },
        { name = "CHANNEL_ID", type = "NUMBER(38,0)" },
        { name = "TOUCHPOINT", type = "VARCHAR(100)" },
        { name = "MODEL", type = "VARCHAR(50)" },
        { name = "WEIGHT", type = "NUMBER(9,4)" },
        { name = "EVENT_TS", type = "TIMESTAMP_NTZ" }
      ]
    }
  }

  temporary_tables = {
    "HR.TMP_PAYROLL_CALC" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "TMP_PAYROLL_CALC"
      columns = [
        { name = "EMPLOYEE_ID", type = "NUMBER(38,0)" },
        { name = "PAY_PERIOD", type = "VARCHAR(20)" },
        { name = "GROSS_PAY", type = "NUMBER(18,2)" },
        { name = "NET_PAY", type = "NUMBER(18,2)" },
        { name = "TAX_WITHHELD", type = "NUMBER(18,2)" },
        { name = "CALCULATED_AT", type = "TIMESTAMP_NTZ" }
      ]
    }
    "HR.TMP_HIRING_PIPELINE" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "TMP_HIRING_PIPELINE"
      columns = [
        { name = "CANDIDATE_ID", type = "NUMBER(38,0)" },
        { name = "ROLE", type = "VARCHAR(100)" },
        { name = "STAGE", type = "VARCHAR(50)" },
        { name = "SOURCE", type = "VARCHAR(50)" },
        { name = "UPDATED_AT", type = "TIMESTAMP_NTZ" }
      ]
    }
    "FINANCE.TMP_FORECAST" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "TMP_FORECAST"
      columns = [
        { name = "FORECAST_ID", type = "NUMBER(38,0)" },
        { name = "FISCAL_MONTH", type = "VARCHAR(7)" },
        { name = "FORECAST_AMOUNT", type = "NUMBER(18,2)" },
        { name = "SCENARIO", type = "VARCHAR(50)" },
        { name = "CREATED_AT", type = "TIMESTAMP_NTZ" }
      ]
    }
    "FINANCE.TMP_CASHFLOW" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "TMP_CASHFLOW"
      columns = [
        { name = "FLOW_DATE", type = "DATE" },
        { name = "INCOMING", type = "NUMBER(18,2)" },
        { name = "OUTGOING", type = "NUMBER(18,2)" },
        { name = "NET_FLOW", type = "NUMBER(18,2)" },
        { name = "UPDATED_AT", type = "TIMESTAMP_NTZ" }
      ]
    }
    "MARKETING.TMP_SPEND_ALLOCATION" = {
      database = "MARKETING"
      schema   = "PUBLIC"
      name     = "TMP_SPEND_ALLOCATION"
      columns = [
        { name = "CAMPAIGN_ID", type = "NUMBER(38,0)" },
        { name = "CHANNEL_ID", type = "NUMBER(38,0)" },
        { name = "BUDGET", type = "NUMBER(18,2)" },
        { name = "ALLOCATION_PCT", type = "NUMBER(5,2)" },
        { name = "UPDATED_AT", type = "TIMESTAMP_NTZ" }
      ]
    }
    "MARKETING.TMP_LEAD_SCORES" = {
      database = "MARKETING"
      schema   = "PUBLIC"
      name     = "TMP_LEAD_SCORES"
      columns = [
        { name = "LEAD_ID", type = "NUMBER(38,0)" },
        { name = "SCORE", type = "NUMBER(5,2)" },
        { name = "MODEL_VERSION", type = "VARCHAR(20)" },
        { name = "SCORED_AT", type = "TIMESTAMP_NTZ" },
        { name = "SCORE_REASON", type = "VARCHAR(200)" }
      ]
    }
  }

  transient_table_fqn = {
    for key, table_def in local.transient_tables :
    key => format("\"%s\".\"%s\".\"%s\"", table_def.database, table_def.schema, table_def.name)
  }

  transient_table_columns_sql = {
    for key, table_def in local.transient_tables :
    key => join(",\n", [
      for col in table_def.columns : format("  \"%s\" %s", col.name, col.type)
    ])
  }

  transient_table_sql = {
    for key, table_def in local.transient_tables :
    key => {
      create = format(
        "CREATE TRANSIENT TABLE IF NOT EXISTS %s (\n%s\n)",
        local.transient_table_fqn[key],
        local.transient_table_columns_sql[key]
      )
      drop = format(
        "DROP TABLE IF EXISTS %s",
        local.transient_table_fqn[key]
      )
    }
  }

  temporary_table_fqn = {
    for key, table_def in local.temporary_tables :
    key => format("\"%s\".\"%s\".\"%s\"", table_def.database, table_def.schema, table_def.name)
  }

  temporary_table_columns_sql = {
    for key, table_def in local.temporary_tables :
    key => join(",\n", [
      for col in table_def.columns : format("  \"%s\" %s", col.name, col.type)
    ])
  }

  temporary_table_sql = {
    for key, table_def in local.temporary_tables :
    key => {
      create = format(
        "CREATE TEMPORARY TABLE IF NOT EXISTS %s (\n%s\n)",
        local.temporary_table_fqn[key],
        local.temporary_table_columns_sql[key]
      )
      drop = format(
        "DROP TABLE IF EXISTS %s",
        local.temporary_table_fqn[key]
      )
    }
  }
}
