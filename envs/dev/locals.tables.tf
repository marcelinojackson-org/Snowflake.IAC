locals {
  tables = {
    "HR.EMPLOYEES" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "EMPLOYEES"
      comment  = "Employee master records."
      columns = [
        { name = "EMPLOYEE_ID", type = "NUMBER(38,0)", nullable = false, default_sequence_key = "HR_EMPLOYEE_SEQ" },
        { name = "FIRST_NAME", type = "VARCHAR(100)" },
        { name = "LAST_NAME", type = "VARCHAR(100)" },
        { name = "EMAIL", type = "VARCHAR(200)" },
        { name = "HIRE_DATE", type = "DATE" },
        { name = "DEPARTMENT_ID", type = "NUMBER(38,0)" }
      ]
    }
    "HR.DEPARTMENTS" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "DEPARTMENTS"
      comment  = "Department definitions."
      columns = [
        { name = "DEPARTMENT_ID", type = "NUMBER(38,0)", nullable = false },
        { name = "DEPARTMENT_NAME", type = "VARCHAR(100)" },
        { name = "COST_CENTER", type = "VARCHAR(50)" },
        { name = "MANAGER_EMPLOYEE_ID", type = "NUMBER(38,0)" },
        { name = "ACTIVE_FLAG", type = "BOOLEAN" }
      ]
    }
    "HR.POSITIONS" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "POSITIONS"
      comment  = "Position catalog."
      columns = [
        { name = "POSITION_ID", type = "NUMBER(38,0)", nullable = false },
        { name = "POSITION_TITLE", type = "VARCHAR(150)" },
        { name = "GRADE", type = "VARCHAR(20)" },
        { name = "EXEMPT_FLAG", type = "BOOLEAN" },
        { name = "CREATED_AT", type = "TIMESTAMP_NTZ" }
      ]
    }
    "HR.BENEFITS" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "BENEFITS"
      comment  = "Benefits catalog."
      columns = [
        { name = "BENEFIT_ID", type = "NUMBER(38,0)", nullable = false },
        { name = "BENEFIT_NAME", type = "VARCHAR(150)" },
        { name = "BENEFIT_TYPE", type = "VARCHAR(50)" },
        { name = "PROVIDER", type = "VARCHAR(100)" },
        { name = "ACTIVE_FLAG", type = "BOOLEAN" }
      ]
    }
    "HR.TIME_OFF_REQUESTS" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "TIME_OFF_REQUESTS"
      comment  = "Time-off requests."
      columns = [
        { name = "REQUEST_ID", type = "NUMBER(38,0)", nullable = false, default_sequence_key = "HR_REQUEST_SEQ" },
        { name = "EMPLOYEE_ID", type = "NUMBER(38,0)", nullable = false },
        { name = "START_DATE", type = "DATE" },
        { name = "END_DATE", type = "DATE" },
        { name = "STATUS", type = "VARCHAR(30)" }
      ]
    }

    "FINANCE.ACCOUNTS" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "ACCOUNTS"
      comment  = "Finance accounts."
      columns = [
        { name = "ACCOUNT_ID", type = "NUMBER(38,0)", nullable = false },
        { name = "ACCOUNT_NAME", type = "VARCHAR(150)" },
        { name = "ACCOUNT_TYPE", type = "VARCHAR(50)" },
        { name = "STATUS", type = "VARCHAR(20)" },
        { name = "OPENED_DATE", type = "DATE" }
      ]
    }
    "FINANCE.TRANSACTIONS" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "TRANSACTIONS"
      comment  = "Financial transactions."
      columns = [
        { name = "TRANSACTION_ID", type = "NUMBER(38,0)", nullable = false },
        { name = "ACCOUNT_ID", type = "NUMBER(38,0)", nullable = false },
        { name = "TRANSACTION_DATE", type = "DATE" },
        { name = "AMOUNT", type = "NUMBER(18,2)" },
        { name = "CURRENCY", type = "VARCHAR(3)" }
      ]
    }
    "FINANCE.BUDGETS" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "BUDGETS"
      comment  = "Department budgets."
      columns = [
        { name = "BUDGET_ID", type = "NUMBER(38,0)", nullable = false },
        { name = "FISCAL_YEAR", type = "NUMBER(4,0)" },
        { name = "DEPARTMENT_ID", type = "NUMBER(38,0)" },
        { name = "AMOUNT", type = "NUMBER(18,2)" },
        { name = "APPROVED_FLAG", type = "BOOLEAN" }
      ]
    }
    "FINANCE.INVOICES" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "INVOICES"
      comment  = "Vendor invoices."
      columns = [
        { name = "INVOICE_ID", type = "NUMBER(38,0)", nullable = false, default_sequence_key = "FINANCE_INVOICE_SEQ" },
        { name = "VENDOR_ID", type = "NUMBER(38,0)" },
        { name = "INVOICE_DATE", type = "DATE" },
        { name = "DUE_DATE", type = "DATE" },
        { name = "TOTAL_AMOUNT", type = "NUMBER(18,2)" }
      ]
    }
    "FINANCE.PAYMENTS" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "PAYMENTS"
      comment  = "Invoice payments."
      columns = [
        { name = "PAYMENT_ID", type = "NUMBER(38,0)", nullable = false, default_sequence_key = "FINANCE_PAYMENT_SEQ" },
        { name = "INVOICE_ID", type = "NUMBER(38,0)", nullable = false },
        { name = "PAYMENT_DATE", type = "DATE" },
        { name = "AMOUNT", type = "NUMBER(18,2)" },
        { name = "METHOD", type = "VARCHAR(30)" }
      ]
    }

    "MARKETING.CAMPAIGNS" = {
      database = "MARKETING"
      schema   = "PUBLIC"
      name     = "CAMPAIGNS"
      comment  = "Marketing campaigns."
      columns = [
        { name = "CAMPAIGN_ID", type = "NUMBER(38,0)", nullable = false, default_sequence_key = "MARKETING_CAMPAIGN_SEQ" },
        { name = "CAMPAIGN_NAME", type = "VARCHAR(150)" },
        { name = "START_DATE", type = "DATE" },
        { name = "END_DATE", type = "DATE" },
        { name = "STATUS", type = "VARCHAR(30)" }
      ]
    }
    "MARKETING.LEADS" = {
      database = "MARKETING"
      schema   = "PUBLIC"
      name     = "LEADS"
      comment  = "Lead records."
      columns = [
        { name = "LEAD_ID", type = "NUMBER(38,0)", nullable = false, default_sequence_key = "MARKETING_LEAD_SEQ" },
        { name = "FIRST_NAME", type = "VARCHAR(100)" },
        { name = "LAST_NAME", type = "VARCHAR(100)" },
        { name = "EMAIL", type = "VARCHAR(200)" },
        { name = "SOURCE", type = "VARCHAR(50)" }
      ]
    }
    "MARKETING.CHANNELS" = {
      database = "MARKETING"
      schema   = "PUBLIC"
      name     = "CHANNELS"
      comment  = "Marketing channels."
      columns = [
        { name = "CHANNEL_ID", type = "NUMBER(38,0)", nullable = false },
        { name = "CHANNEL_NAME", type = "VARCHAR(100)" },
        { name = "CHANNEL_TYPE", type = "VARCHAR(50)" },
        { name = "COST_PER_LEAD", type = "NUMBER(18,2)" },
        { name = "ACTIVE_FLAG", type = "BOOLEAN" }
      ]
    }
    "MARKETING.CONTENT" = {
      database = "MARKETING"
      schema   = "PUBLIC"
      name     = "CONTENT"
      comment  = "Content catalog."
      columns = [
        { name = "CONTENT_ID", type = "NUMBER(38,0)", nullable = false },
        { name = "TITLE", type = "VARCHAR(200)" },
        { name = "CONTENT_TYPE", type = "VARCHAR(50)" },
        { name = "PUBLISHED_DATE", type = "DATE" },
        { name = "STATUS", type = "VARCHAR(30)" }
      ]
    }
    "MARKETING.ENGAGEMENTS" = {
      database = "MARKETING"
      schema   = "PUBLIC"
      name     = "ENGAGEMENTS"
      comment  = "Campaign engagements."
      columns = [
        { name = "ENGAGEMENT_ID", type = "NUMBER(38,0)", nullable = false },
        { name = "CAMPAIGN_ID", type = "NUMBER(38,0)" },
        { name = "CHANNEL_ID", type = "NUMBER(38,0)" },
        { name = "ENGAGEMENT_DATE", type = "DATE" },
        { name = "METRIC_VALUE", type = "NUMBER(18,2)" }
      ]
    }
  }
}
