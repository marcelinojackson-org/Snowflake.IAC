locals {
  masking_policies = {
    "HR.EMAIL_MASK" = {
      database         = "HR"
      schema           = "PUBLIC"
      name             = "EMAIL_MASK"
      return_data_type = "VARCHAR"
      body             = <<-SQL
        CASE
          WHEN CURRENT_ROLE() IN ('SECURITYADMIN', 'SYSADMIN') THEN VAL
          ELSE CONCAT('***', RIGHT(VAL, 4))
        END
      SQL
      arguments = [
        { name = "VAL", type = "VARCHAR" }
      ]
      comment = "Mask email addresses for non-admin roles."
    }
    "FINANCE.AMOUNT_MASK" = {
      database         = "FINANCE"
      schema           = "PUBLIC"
      name             = "AMOUNT_MASK"
      return_data_type = "NUMBER(18,2)"
      body             = <<-SQL
        CASE
          WHEN CURRENT_ROLE() IN ('FINANCE_ADMIN', 'SYSADMIN') THEN VAL
          ELSE NULL
        END
      SQL
      arguments = [
        { name = "VAL", type = "NUMBER(18,2)" }
      ]
      comment = "Mask payment amounts for non-finance roles."
    }
  }

  row_access_policies = {
    "HR.EMPLOYEE_RAP" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "EMPLOYEE_RAP"
      body     = "CASE WHEN CURRENT_ROLE() IN ('HR_ANALYST', 'SYSADMIN') THEN TRUE ELSE FALSE END"
      arguments = [
        { name = "DEPT_ID", type = "NUMBER(38,0)" }
      ]
      comment = "Restrict employee rows to HR roles."
    }
  }
}
