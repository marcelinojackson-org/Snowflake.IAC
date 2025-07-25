locals {
  external_tables = {
    "HR.EXT_EMPLOYEES_RAW" = {
      database    = "HR"
      schema      = "PUBLIC"
      name        = "EXT_EMPLOYEES_RAW"
      location    = "@${module.stages["HR.RAW_STAGE"].fully_qualified_name}"
      file_format = "TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1"
      pattern     = "employees/.*"
      comment     = "External raw employees data."
      columns = [
        { name = "EMPLOYEE_ID", type = "NUMBER(38,0)", as = "$1" },
        { name = "EMPLOYEE_NUMBER", type = "VARCHAR", as = "$2" },
        { name = "FIRST_NAME", type = "VARCHAR", as = "$3" },
        { name = "LAST_NAME", type = "VARCHAR", as = "$4" },
        { name = "EMAIL", type = "VARCHAR", as = "$5" },
        { name = "HIRE_DATE", type = "DATE", as = "TO_DATE($6)" },
        { name = "DEPARTMENT_ID", type = "NUMBER(38,0)", as = "$7" },
        { name = "JOB_TITLE", type = "VARCHAR", as = "$8" },
        { name = "EMPLOYMENT_STATUS", type = "VARCHAR", as = "$9" },
        { name = "BASE_SALARY", type = "NUMBER(18,2)", as = "$10" },
        { name = "SALARY_CURRENCY", type = "VARCHAR", as = "$11" }
      ]
    }
    "FINANCE.EXT_TRANSACTIONS_RAW" = {
      database    = "FINANCE"
      schema      = "PUBLIC"
      name        = "EXT_TRANSACTIONS_RAW"
      location    = "@${module.stages["FINANCE.RAW_STAGE"].fully_qualified_name}"
      file_format = "TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1"
      pattern     = "transactions/.*"
      comment     = "External raw transactions data."
      columns = [
        { name = "TRANSACTION_ID", type = "NUMBER(38,0)", as = "$1" },
        { name = "ACCOUNT_ID", type = "NUMBER(38,0)", as = "$2" },
        { name = "TRANSACTION_DATE", type = "DATE", as = "TO_DATE($3)" },
        { name = "AMOUNT", type = "NUMBER(18,2)", as = "$4" },
        { name = "CURRENCY", type = "VARCHAR", as = "$5" },
        { name = "DESCRIPTION", type = "VARCHAR", as = "$6" },
        { name = "MERCHANT_NAME", type = "VARCHAR", as = "$7" },
        { name = "CATEGORY", type = "VARCHAR", as = "$8" },
        { name = "STATUS", type = "VARCHAR", as = "$9" }
      ]
    }
    "MARKETING.EXT_LEADS_RAW" = {
      database    = "MARKETING"
      schema      = "PUBLIC"
      name        = "EXT_LEADS_RAW"
      location    = "@${module.stages["MARKETING.RAW_STAGE"].fully_qualified_name}"
      file_format = "TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1"
      pattern     = "leads/.*"
      comment     = "External raw leads data."
      columns = [
        { name = "LEAD_ID", type = "NUMBER(38,0)", as = "$1" },
        { name = "FIRST_NAME", type = "VARCHAR", as = "$2" },
        { name = "LAST_NAME", type = "VARCHAR", as = "$3" },
        { name = "EMAIL", type = "VARCHAR", as = "$4" },
        { name = "PHONE", type = "VARCHAR", as = "$5" },
        { name = "COMPANY", type = "VARCHAR", as = "$6" },
        { name = "SOURCE", type = "VARCHAR", as = "$7" },
        { name = "STATUS", type = "VARCHAR", as = "$8" }
      ]
    }
  }
}
