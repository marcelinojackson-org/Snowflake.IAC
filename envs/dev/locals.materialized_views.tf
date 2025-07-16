locals {
  materialized_views = {
    "HR.MV_EMP_COUNT_BY_DEPT" = {
      database      = "HR"
      schema        = "PUBLIC"
      name          = "MV_EMP_COUNT_BY_DEPT"
      warehouse_key = "DEV_WH_MEDIUM"
      comment       = "Employee counts by department."
      statement     = <<-SQL
        SELECT
          department_id,
          COUNT(*) AS employee_count
        FROM "HR"."PUBLIC"."EMPLOYEES"
        GROUP BY department_id;
      SQL
    }
    "FINANCE.MV_DAILY_PAYMENTS" = {
      database      = "FINANCE"
      schema        = "PUBLIC"
      name          = "MV_DAILY_PAYMENTS"
      warehouse_key = "DEV_WH_MEDIUM"
      comment       = "Daily payment totals."
      statement     = <<-SQL
        SELECT
          payment_date,
          SUM(amount) AS total_amount
        FROM "FINANCE"."PUBLIC"."PAYMENTS"
        GROUP BY payment_date;
      SQL
    }
  }
}
