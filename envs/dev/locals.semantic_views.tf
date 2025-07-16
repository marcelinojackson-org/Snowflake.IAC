locals {
  semantic_views = {
    "HR.SEM_EMPLOYEE" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "SEM_EMPLOYEE"
      comment  = "Semantic view for employee analytics."
      tables = [
        {
          table_alias = "EMP"
          table_name  = module.tables["HR.EMPLOYEES"].fully_qualified_name
          primary_key = ["EMPLOYEE_ID"]
        }
      ]
      dimensions = [
        {
          qualified_expression_name = "\"EMP\".\"DEPARTMENT_ID\""
          sql_expression            = "\"EMP\".\"DEPARTMENT_ID\""
        },
        {
          qualified_expression_name = "\"EMP\".\"LAST_NAME\""
          sql_expression            = "\"EMP\".\"LAST_NAME\""
        }
      ]
      metrics = [
        {
          qualified_expression_name = "\"EMP\".\"EMP_COUNT\""
          sql_expression            = "COUNT(*)"
        }
      ]
    }
    "FINANCE.SEM_TRANSACTIONS" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "SEM_TRANSACTIONS"
      comment  = "Semantic view for transaction analytics."
      tables = [
        {
          table_alias = "TRX"
          table_name  = module.tables["FINANCE.TRANSACTIONS"].fully_qualified_name
          primary_key = ["TRANSACTION_ID"]
        }
      ]
      dimensions = [
        {
          qualified_expression_name = "\"TRX\".\"TRANSACTION_DATE\""
          sql_expression            = "\"TRX\".\"TRANSACTION_DATE\""
        },
        {
          qualified_expression_name = "\"TRX\".\"CURRENCY\""
          sql_expression            = "\"TRX\".\"CURRENCY\""
        }
      ]
      metrics = [
        {
          qualified_expression_name = "\"TRX\".\"TOTAL_AMOUNT\""
          sql_expression            = "SUM(\"TRX\".\"AMOUNT\")"
        }
      ]
    }
  }
}
