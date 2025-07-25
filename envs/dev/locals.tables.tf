locals {
  tables = {
    "HR.EMPLOYEES" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "EMPLOYEES"
      comment  = "Employee master records."
      columns = [
        { name = "EMPLOYEE_ID", type = "NUMBER(38,0)", nullable = false, default_sequence_key = "HR_EMPLOYEE_SEQ" },
        { name = "EMPLOYEE_NUMBER", type = "VARCHAR(30)" },
        { name = "FIRST_NAME", type = "VARCHAR(100)" },
        { name = "MIDDLE_NAME", type = "VARCHAR(100)" },
        { name = "LAST_NAME", type = "VARCHAR(100)" },
        { name = "PREFERRED_NAME", type = "VARCHAR(100)" },
        { name = "EMAIL", type = "VARCHAR(200)" },
        { name = "PHONE", type = "VARCHAR(30)" },
        { name = "HIRE_DATE", type = "DATE" },
        { name = "JOB_TITLE", type = "VARCHAR(150)" },
        { name = "DEPARTMENT_ID", type = "NUMBER(38,0)" },
        { name = "MANAGER_ID", type = "NUMBER(38,0)" },
        { name = "LOCATION", type = "VARCHAR(100)" },
        { name = "EMPLOYMENT_STATUS", type = "VARCHAR(30)" },
        { name = "BASE_SALARY", type = "NUMBER(18,2)" },
        { name = "SALARY_CURRENCY", type = "VARCHAR(3)" },
        { name = "LAST_PROMOTION_DATE", type = "DATE" },
        { name = "TERMINATION_DATE", type = "DATE" },
        { name = "UPDATED_AT", type = "TIMESTAMP_NTZ" }
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
        { name = "LOCATION", type = "VARCHAR(100)" },
        { name = "BUDGET_AMOUNT", type = "NUMBER(18,2)" },
        { name = "ACTIVE_FLAG", type = "BOOLEAN" },
        { name = "UPDATED_AT", type = "TIMESTAMP_NTZ" }
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
        { name = "JOB_FAMILY", type = "VARCHAR(80)" },
        { name = "GRADE", type = "VARCHAR(20)" },
        { name = "EXEMPT_FLAG", type = "BOOLEAN" },
        { name = "MIN_SALARY", type = "NUMBER(18,2)" },
        { name = "MAX_SALARY", type = "NUMBER(18,2)" },
        { name = "CREATED_AT", type = "TIMESTAMP_NTZ" },
        { name = "UPDATED_AT", type = "TIMESTAMP_NTZ" }
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
        { name = "PLAN_CODE", type = "VARCHAR(50)" },
        { name = "PROVIDER", type = "VARCHAR(100)" },
        { name = "COVERAGE_LEVEL", type = "VARCHAR(50)" },
        { name = "EMPLOYEE_COST", type = "NUMBER(18,2)" },
        { name = "EMPLOYER_COST", type = "NUMBER(18,2)" },
        { name = "EFFECTIVE_DATE", type = "DATE" },
        { name = "END_DATE", type = "DATE" },
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
        { name = "REQUESTED_DAYS", type = "NUMBER(5,2)" },
        { name = "STATUS", type = "VARCHAR(30)" },
        { name = "REASON", type = "VARCHAR(200)" },
        { name = "REQUESTED_AT", type = "TIMESTAMP_NTZ" },
        { name = "APPROVED_BY", type = "NUMBER(38,0)" },
        { name = "APPROVED_AT", type = "TIMESTAMP_NTZ" }
      ]
    }

    "FINANCE.ACCOUNTS" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "ACCOUNTS"
      comment  = "Finance accounts."
      columns = [
        { name = "ACCOUNT_ID", type = "NUMBER(38,0)", nullable = false },
        { name = "ACCOUNT_NUMBER", type = "VARCHAR(30)" },
        { name = "ACCOUNT_NAME", type = "VARCHAR(150)" },
        { name = "ACCOUNT_TYPE", type = "VARCHAR(50)" },
        { name = "GL_CODE", type = "VARCHAR(20)" },
        { name = "STATUS", type = "VARCHAR(20)" },
        { name = "OWNER_DEPARTMENT_ID", type = "NUMBER(38,0)" },
        { name = "OPENED_DATE", type = "DATE" },
        { name = "CLOSED_DATE", type = "DATE" },
        { name = "UPDATED_AT", type = "TIMESTAMP_NTZ" }
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
        { name = "POSTED_TS", type = "TIMESTAMP_NTZ" },
        { name = "DESCRIPTION", type = "VARCHAR(200)" },
        { name = "MERCHANT_NAME", type = "VARCHAR(150)" },
        { name = "CATEGORY", type = "VARCHAR(50)" },
        { name = "AMOUNT", type = "NUMBER(18,2)" },
        { name = "CURRENCY", type = "VARCHAR(3)" },
        { name = "STATUS", type = "VARCHAR(20)" }
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
        { name = "APPROVED_FLAG", type = "BOOLEAN" },
        { name = "APPROVED_BY", type = "NUMBER(38,0)" },
        { name = "APPROVED_AT", type = "TIMESTAMP_NTZ" },
        { name = "CREATED_AT", type = "TIMESTAMP_NTZ" }
      ]
    }
    "FINANCE.INVOICES" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "INVOICES"
      comment  = "Vendor invoices."
      columns = [
        { name = "INVOICE_ID", type = "NUMBER(38,0)", nullable = false, default_sequence_key = "FINANCE_INVOICE_SEQ" },
        { name = "INVOICE_NUMBER", type = "VARCHAR(40)" },
        { name = "VENDOR_ID", type = "NUMBER(38,0)" },
        { name = "INVOICE_DATE", type = "DATE" },
        { name = "DUE_DATE", type = "DATE" },
        { name = "TOTAL_AMOUNT", type = "NUMBER(18,2)" },
        { name = "STATUS", type = "VARCHAR(20)" },
        { name = "CREATED_AT", type = "TIMESTAMP_NTZ" }
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
        { name = "METHOD", type = "VARCHAR(30)" },
        { name = "PAYMENT_STATUS", type = "VARCHAR(20)" },
        { name = "REFERENCE_NUMBER", type = "VARCHAR(50)" },
        { name = "CREATED_AT", type = "TIMESTAMP_NTZ" }
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
        { name = "CAMPAIGN_TYPE", type = "VARCHAR(50)" },
        { name = "START_DATE", type = "DATE" },
        { name = "END_DATE", type = "DATE" },
        { name = "STATUS", type = "VARCHAR(30)" },
        { name = "BUDGET", type = "NUMBER(18,2)" },
        { name = "OWNER", type = "VARCHAR(100)" },
        { name = "CREATED_AT", type = "TIMESTAMP_NTZ" }
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
        { name = "PHONE", type = "VARCHAR(30)" },
        { name = "COMPANY", type = "VARCHAR(150)" },
        { name = "TITLE", type = "VARCHAR(100)" },
        { name = "SOURCE", type = "VARCHAR(50)" },
        { name = "STATUS", type = "VARCHAR(30)" },
        { name = "CREATED_AT", type = "TIMESTAMP_NTZ" }
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
        { name = "PLATFORM", type = "VARCHAR(50)" },
        { name = "REGION", type = "VARCHAR(50)" },
        { name = "COST_PER_LEAD", type = "NUMBER(18,2)" },
        { name = "ACTIVE_FLAG", type = "BOOLEAN" },
        { name = "CREATED_AT", type = "TIMESTAMP_NTZ" }
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
        { name = "AUTHOR", type = "VARCHAR(100)" },
        { name = "URL", type = "VARCHAR(500)" },
        { name = "WORD_COUNT", type = "NUMBER(10,0)" },
        { name = "PUBLISHED_DATE", type = "DATE" },
        { name = "STATUS", type = "VARCHAR(30)" },
        { name = "CREATED_AT", type = "TIMESTAMP_NTZ" }
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
        { name = "EVENT_TYPE", type = "VARCHAR(50)" },
        { name = "SOURCE", type = "VARCHAR(50)" },
        { name = "METRIC_VALUE", type = "NUMBER(18,2)" },
        { name = "CREATED_AT", type = "TIMESTAMP_NTZ" }
      ]
    }
  }
}
