locals {
  tasks = {
    "HR.EMPLOYEE_EVENT_TASK" = {
      database         = "HR"
      schema           = "PUBLIC"
      name             = "EMPLOYEE_EVENT_TASK"
      warehouse_key    = "DEV_WH_SMALL"
      schedule_minutes = 15
      comment          = "Load employee stream changes into transient events."
      sql_statement    = <<-SQL
        INSERT INTO "HR"."PUBLIC"."TRN_EMPLOYEE_EVENTS" (EVENT_ID, EMPLOYEE_ID, EVENT_TYPE, EVENT_TS)
        SELECT
          NULL,
          EMPLOYEE_ID,
          'STREAM_CHANGE',
          CURRENT_TIMESTAMP()
        FROM "HR"."PUBLIC"."EMPLOYEES_STREAM";
      SQL
    }
    "FINANCE.PAYMENT_ROLLUP_TASK" = {
      database         = "FINANCE"
      schema           = "PUBLIC"
      name             = "PAYMENT_ROLLUP_TASK"
      warehouse_key    = "DEV_WH_SMALL"
      schedule_minutes = 30
      comment          = "Recalculate daily payment rollups."
      sql_statement    = "CALL \"FINANCE\".\"PUBLIC\".\"RECALC_DAILY_TRANSACTIONS\"()"
    }
  }
}
