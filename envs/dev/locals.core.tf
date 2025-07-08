locals {
  warehouses = {
    DEV_WH_SMALL = {
      warehouse_size = "SMALL"
      auto_suspend   = 300
      auto_resume    = "true"
      comment        = "Small general-purpose warehouse."
    }
    DEV_WH_MEDIUM = {
      warehouse_size = "MEDIUM"
      auto_suspend   = 300
      auto_resume    = "true"
      comment        = "Medium general-purpose warehouse."
    }
    DEV_WH_LARGE = {
      warehouse_size = "LARGE"
      auto_suspend   = 300
      auto_resume    = "true"
      comment        = "Large general-purpose warehouse."
    }
  }

  databases = {
    HR = {
      comment = "Human Resources database."
    }
    FINANCE = {
      comment = "Finance database."
    }
    MARKETING = {
      comment = "Marketing database."
    }
  }

  schemas = {
    "HR.PUBLIC" = {
      database = "HR"
      name     = "PUBLIC"
      comment  = "HR public schema."
    }
    "FINANCE.PUBLIC" = {
      database = "FINANCE"
      name     = "PUBLIC"
      comment  = "Finance public schema."
    }
    "MARKETING.PUBLIC" = {
      database = "MARKETING"
      name     = "PUBLIC"
      comment  = "Marketing public schema."
    }
  }

  sequences = {
    HR_EMPLOYEE_SEQ = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "EMPLOYEE_SEQ"
      comment  = "Employee id sequence."
    }
    HR_REQUEST_SEQ = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "REQUEST_SEQ"
      comment  = "Time-off request sequence."
    }
    FINANCE_INVOICE_SEQ = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "INVOICE_SEQ"
      comment  = "Invoice id sequence."
    }
    FINANCE_PAYMENT_SEQ = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "PAYMENT_SEQ"
      comment  = "Payment id sequence."
    }
    MARKETING_CAMPAIGN_SEQ = {
      database = "MARKETING"
      schema   = "PUBLIC"
      name     = "CAMPAIGN_SEQ"
      comment  = "Campaign id sequence."
    }
    MARKETING_LEAD_SEQ = {
      database = "MARKETING"
      schema   = "PUBLIC"
      name     = "LEAD_SEQ"
      comment  = "Lead id sequence."
    }
  }
}
