locals {
  shares = {
    HR_SHARE = {
      name     = "HR_SHARE"
      comment  = "Share HR data sets."
      accounts = try(var.share_accounts["HR_SHARE"], [])
    }
    FINANCE_SHARE = {
      name     = "FINANCE_SHARE"
      comment  = "Share finance data sets."
      accounts = try(var.share_accounts["FINANCE_SHARE"], [])
    }
  }

  share_grants = {
    "HR_SHARE_DB" = {
      to_share    = "HR_SHARE"
      privileges  = ["USAGE"]
      on_database = "HR"
    }
    "HR_SHARE_SCHEMA" = {
      to_share   = "HR_SHARE"
      privileges = ["USAGE"]
      on_schema  = "HR.PUBLIC"
    }
    "HR_SHARE_TABLES" = {
      to_share                = "HR_SHARE"
      privileges              = ["SELECT"]
      on_all_tables_in_schema = "HR.PUBLIC"
    }
    "FINANCE_SHARE_DB" = {
      to_share    = "FINANCE_SHARE"
      privileges  = ["USAGE"]
      on_database = "FINANCE"
    }
    "FINANCE_SHARE_SCHEMA" = {
      to_share   = "FINANCE_SHARE"
      privileges = ["USAGE"]
      on_schema  = "FINANCE.PUBLIC"
    }
    "FINANCE_SHARE_TABLES" = {
      to_share                = "FINANCE_SHARE"
      privileges              = ["SELECT"]
      on_all_tables_in_schema = "FINANCE.PUBLIC"
    }
  }
}
