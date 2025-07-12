locals {
  dynamic_tables = {
    "HR.EMPLOYEE_ROSTER_DT" = {
      database                    = "HR"
      schema                      = "PUBLIC"
      name                        = "EMPLOYEE_ROSTER_DT"
      warehouse_key               = "DEV_WH_MEDIUM"
      target_lag_maximum_duration = "20 minutes"
      comment                     = "Dynamic roster table."
      query                       = <<-SQL
        SELECT
          e.employee_id,
          e.first_name,
          e.last_name,
          d.department_name
        FROM "HR"."PUBLIC"."EMPLOYEES" e
        LEFT JOIN "HR"."PUBLIC"."DEPARTMENTS" d
          ON e.department_id = d.department_id;
      SQL
    }
    "FINANCE.DAILY_TRANSACTIONS_DT" = {
      database                    = "FINANCE"
      schema                      = "PUBLIC"
      name                        = "DAILY_TRANSACTIONS_DT"
      warehouse_key               = "DEV_WH_MEDIUM"
      target_lag_maximum_duration = "30 minutes"
      comment                     = "Daily transaction totals."
      query                       = <<-SQL
        SELECT
          t.transaction_date,
          SUM(t.amount) AS total_amount,
          t.currency
        FROM "FINANCE"."PUBLIC"."TRANSACTIONS" t
        GROUP BY t.transaction_date, t.currency;
      SQL
    }
    "MARKETING.CAMPAIGN_METRICS_DT" = {
      database                    = "MARKETING"
      schema                      = "PUBLIC"
      name                        = "CAMPAIGN_METRICS_DT"
      warehouse_key               = "DEV_WH_MEDIUM"
      target_lag_maximum_duration = "30 minutes"
      comment                     = "Campaign engagement metrics."
      query                       = <<-SQL
        SELECT
          e.campaign_id,
          COUNT(*) AS engagement_count,
          SUM(e.metric_value) AS total_metric
        FROM "MARKETING"."PUBLIC"."ENGAGEMENTS" e
        GROUP BY e.campaign_id;
      SQL
    }
  }
}
