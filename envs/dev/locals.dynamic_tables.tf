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
          e.job_title,
          e.employment_status,
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
          t.currency,
          t.status,
          SUM(t.amount) AS total_amount
        FROM "FINANCE"."PUBLIC"."TRANSACTIONS" t
        GROUP BY t.transaction_date, t.currency, t.status;
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
          e.event_type,
          COUNT(*) AS engagement_count,
          SUM(e.metric_value) AS total_metric
        FROM "MARKETING"."PUBLIC"."ENGAGEMENTS" e
        GROUP BY e.campaign_id, e.event_type;
      SQL
    }
    "HR.EMPLOYEE_EVENTS_DT" = {
      database                    = "HR"
      schema                      = "PUBLIC"
      name                        = "EMPLOYEE_EVENTS_DT"
      warehouse_key               = "DEV_WH_MEDIUM"
      target_lag_maximum_duration = "30 minutes"
      comment                     = "Daily employee event counts."
      query                       = <<-SQL
        SELECT
          DATE_TRUNC('DAY', event_ts) AS event_date,
          event_type,
          COUNT(*) AS event_count
        FROM "HR"."PUBLIC"."TRN_EMPLOYEE_EVENTS"
        GROUP BY DATE_TRUNC('DAY', event_ts), event_type;
      SQL
    }
    "FINANCE.PAYMENT_EVENTS_DT" = {
      database                    = "FINANCE"
      schema                      = "PUBLIC"
      name                        = "PAYMENT_EVENTS_DT"
      warehouse_key               = "DEV_WH_MEDIUM"
      target_lag_maximum_duration = "30 minutes"
      comment                     = "Daily payment event counts."
      query                       = <<-SQL
        SELECT
          payment_date AS event_date,
          payment_status,
          COUNT(*) AS event_count
        FROM "FINANCE"."PUBLIC"."PAYMENTS"
        GROUP BY payment_date, payment_status;
      SQL
    }
  }
}
