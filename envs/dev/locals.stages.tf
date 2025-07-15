locals {
  stages = {
    "HR.RAW_STAGE" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "RAW_STAGE"
      url      = format("s3://%s/", var.stage_bucket_raw)
      comment  = "Raw landing stage."
    }
    "HR.SILVER_STAGE" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "SILVER_STAGE"
      url      = format("s3://%s/", var.stage_bucket_silver)
      comment  = "Silver refined stage."
    }
    "HR.GOLD_STAGE" = {
      database = "HR"
      schema   = "PUBLIC"
      name     = "GOLD_STAGE"
      url      = format("s3://%s/", var.stage_bucket_gold)
      comment  = "Gold curated stage."
    }
    "FINANCE.RAW_STAGE" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "RAW_STAGE"
      url      = format("s3://%s/", var.stage_bucket_raw)
      comment  = "Raw landing stage."
    }
    "FINANCE.SILVER_STAGE" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "SILVER_STAGE"
      url      = format("s3://%s/", var.stage_bucket_silver)
      comment  = "Silver refined stage."
    }
    "FINANCE.GOLD_STAGE" = {
      database = "FINANCE"
      schema   = "PUBLIC"
      name     = "GOLD_STAGE"
      url      = format("s3://%s/", var.stage_bucket_gold)
      comment  = "Gold curated stage."
    }
    "MARKETING.RAW_STAGE" = {
      database = "MARKETING"
      schema   = "PUBLIC"
      name     = "RAW_STAGE"
      url      = format("s3://%s/", var.stage_bucket_raw)
      comment  = "Raw landing stage."
    }
    "MARKETING.SILVER_STAGE" = {
      database = "MARKETING"
      schema   = "PUBLIC"
      name     = "SILVER_STAGE"
      url      = format("s3://%s/", var.stage_bucket_silver)
      comment  = "Silver refined stage."
    }
    "MARKETING.GOLD_STAGE" = {
      database = "MARKETING"
      schema   = "PUBLIC"
      name     = "GOLD_STAGE"
      url      = format("s3://%s/", var.stage_bucket_gold)
      comment  = "Gold curated stage."
    }
  }
}
