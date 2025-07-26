locals {
  views = {
    "HR.EMPLOYEE_DIRECTORY" = {
      database  = "HR"
      schema    = "PUBLIC"
      name      = "EMPLOYEE_DIRECTORY"
      comment   = "Employee directory with department names."
      statement = <<-SQL
        SELECT
          e.employee_id,
          e.first_name,
          e.last_name,
          e.email,
          e.job_title,
          e.employment_status,
          d.department_name
        FROM "HR"."PUBLIC"."EMPLOYEES" e
        LEFT JOIN "HR"."PUBLIC"."DEPARTMENTS" d
          ON e.department_id = d.department_id;
      SQL
    }
    "HR.TIME_OFF_OVERVIEW" = {
      database  = "HR"
      schema    = "PUBLIC"
      name      = "TIME_OFF_OVERVIEW"
      comment   = "Time-off request overview."
      statement = <<-SQL
        SELECT
          r.request_id,
          r.employee_id,
          r.start_date,
          r.end_date,
          r.requested_days,
          r.status,
          r.reason
        FROM "HR"."PUBLIC"."TIME_OFF_REQUESTS" r;
      SQL
    }
    "FINANCE.OPEN_INVOICES" = {
      database  = "FINANCE"
      schema    = "PUBLIC"
      name      = "OPEN_INVOICES"
      comment   = "Invoices that have not been paid."
      statement = <<-SQL
        SELECT
          i.invoice_id,
          i.invoice_number,
          i.vendor_id,
          i.invoice_date,
          i.due_date,
          i.total_amount,
          i.status
        FROM "FINANCE"."PUBLIC"."INVOICES" i
        LEFT JOIN "FINANCE"."PUBLIC"."PAYMENTS" p
          ON i.invoice_id = p.invoice_id
        WHERE p.payment_id IS NULL;
      SQL
    }
    "FINANCE.ACCOUNT_ACTIVITY" = {
      database  = "FINANCE"
      schema    = "PUBLIC"
      name      = "ACCOUNT_ACTIVITY"
      comment   = "Account activity with transactions."
      statement = <<-SQL
        SELECT
          a.account_id,
          a.account_number,
          a.account_name,
          a.account_type,
          a.status,
          t.transaction_date,
          t.amount,
          t.currency,
          t.category
        FROM "FINANCE"."PUBLIC"."ACCOUNTS" a
        LEFT JOIN "FINANCE"."PUBLIC"."TRANSACTIONS" t
          ON a.account_id = t.account_id;
      SQL
    }
    "MARKETING.CAMPAIGN_PERFORMANCE" = {
      database  = "MARKETING"
      schema    = "PUBLIC"
      name      = "CAMPAIGN_PERFORMANCE"
      comment   = "Campaign performance metrics."
      statement = <<-SQL
        SELECT
          c.campaign_id,
          c.campaign_name,
          c.campaign_type,
          c.status,
          e.engagement_date,
          e.event_type,
          e.metric_value
        FROM "MARKETING"."PUBLIC"."CAMPAIGNS" c
        LEFT JOIN "MARKETING"."PUBLIC"."ENGAGEMENTS" e
          ON c.campaign_id = e.campaign_id;
      SQL
    }
    "MARKETING.LEAD_SOURCES" = {
      database  = "MARKETING"
      schema    = "PUBLIC"
      name      = "LEAD_SOURCES"
      comment   = "Lead sources view."
      statement = <<-SQL
        SELECT
          l.lead_id,
          l.first_name,
          l.last_name,
          l.email,
          l.company,
          l.source,
          l.status
        FROM "MARKETING"."PUBLIC"."LEADS" l;
      SQL
    }
  }

  streams = {
    "HR.EMPLOYEES_STREAM" = {
      database          = "HR"
      schema            = "PUBLIC"
      name              = "EMPLOYEES_STREAM"
      table_key         = "HR.EMPLOYEES"
      append_only       = "true"
      show_initial_rows = "true"
      comment           = "Stream on HR employees."
    }
    "FINANCE.INVOICES_STREAM" = {
      database          = "FINANCE"
      schema            = "PUBLIC"
      name              = "INVOICES_STREAM"
      table_key         = "FINANCE.INVOICES"
      append_only       = "false"
      show_initial_rows = "true"
      comment           = "Stream on finance invoices."
    }
    "MARKETING.LEADS_STREAM" = {
      database          = "MARKETING"
      schema            = "PUBLIC"
      name              = "LEADS_STREAM"
      table_key         = "MARKETING.LEADS"
      append_only       = "true"
      show_initial_rows = "true"
      comment           = "Stream on marketing leads."
    }
  }
}
