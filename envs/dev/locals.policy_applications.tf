locals {
  masking_policy_applications = {
    "HR.EMAIL_MASK" = {
      table_key          = "HR.EMPLOYEES"
      column             = "EMAIL"
      masking_policy_key = "HR.EMAIL_MASK"
    }
    "FINANCE.AMOUNT_MASK" = {
      table_key          = "FINANCE.PAYMENTS"
      column             = "AMOUNT"
      masking_policy_key = "FINANCE.AMOUNT_MASK"
    }
  }

  row_access_policy_applications = {
    "HR.EMPLOYEE_RAP" = {
      table_key  = "HR.EMPLOYEES"
      policy_key = "HR.EMPLOYEE_RAP"
      columns    = ["DEPARTMENT_ID"]
    }
  }
}
