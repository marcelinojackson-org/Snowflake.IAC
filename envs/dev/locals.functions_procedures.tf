locals {
  functions = {
    "HR.NORMALIZE_EMAIL" = {
      database            = "HR"
      schema              = "PUBLIC"
      name                = "NORMALIZE_EMAIL"
      return_type         = "VARCHAR"
      function_definition = "LOWER(email)"
      arguments = [
        {
          arg_name      = "email"
          arg_data_type = "VARCHAR"
        }
      ]
      comment = "Normalize email addresses to lowercase."
    }
    "FINANCE.FISCAL_YEAR" = {
      database            = "FINANCE"
      schema              = "PUBLIC"
      name                = "FISCAL_YEAR"
      return_type         = "NUMBER(4,0)"
      function_definition = "CASE WHEN MONTH(arg_date) >= 10 THEN YEAR(arg_date) + 1 ELSE YEAR(arg_date) END"
      arguments = [
        {
          arg_name      = "arg_date"
          arg_data_type = "DATE"
        }
      ]
      comment = "Calculate fiscal year starting in October."
    }
  }

  procedures = {
    "HR.LOG_EMP_EVENT" = {
      database             = "HR"
      schema               = "PUBLIC"
      name                 = "LOG_EMP_EVENT"
      return_type          = "VARCHAR"
      execute_as           = "CALLER"
      procedure_definition = <<-SQL
        BEGIN
          INSERT INTO "HR"."PUBLIC"."TRN_EMPLOYEE_EVENTS" (EVENT_ID, EMPLOYEE_ID, EVENT_TYPE, EVENT_TS)
          VALUES (NULL, emp_id, event_type, CURRENT_TIMESTAMP());
          RETURN 'OK';
        END;
      SQL
      arguments = [
        {
          arg_name      = "emp_id"
          arg_data_type = "NUMBER(38,0)"
        },
        {
          arg_name      = "event_type"
          arg_data_type = "VARCHAR"
        }
      ]
      comment = "Log an employee event into the transient table."
    }
    "FINANCE.RECALC_DAILY_TRANSACTIONS" = {
      database             = "FINANCE"
      schema               = "PUBLIC"
      name                 = "RECALC_DAILY_TRANSACTIONS"
      return_type          = "VARCHAR"
      execute_as           = "CALLER"
      procedure_definition = <<-SQL
        BEGIN
          RETURN 'OK';
        END;
      SQL
      arguments            = []
      comment              = "Placeholder procedure for daily transaction rollups."
    }
  }
}
