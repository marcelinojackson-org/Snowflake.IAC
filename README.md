# Snowflake.IAC

Terraform-based infrastructure-as-code for Snowflake. This project provisions:
- Warehouses (small, medium, large)
- Databases (HR, FINANCE, MARKETING)
- Schemas, tables, views, sequences, streams, and dynamic tables
- Additional transient and temporary tables via SQL execution

## Structure

```
Snowflake.IAC/
  envs/
    dev/
      terraform.tf
      warehouses.tf
      databases_schemas.tf
      sequences_tables.tf
      views_streams.tf
      dynamic_tables.tf
      temp_tables.tf
      locals.*.tf
      variables.tf
      outputs.tf
      terraform.tfvars.example
  modules/
    warehouse/
    database/
    schema/
    table/
    view/
    sequence/
    stream_on_table/
    dynamic_table/
    stage/
```

## Prerequisites

- Terraform 1.5+
- Snowflake account with permissions to create warehouses, databases, schemas, and objects
- A bootstrap warehouse that already exists (used by the provider connection)
- Snowflake CLI (SnowCLI) for running ad-hoc SQL and COPY INTO commands (optional)

### SnowCLI prerequisites and install

SnowCLI install options and prerequisites:

- Homebrew (macOS):
  ```bash
  brew tap snowflakedb/snowflake-cli
  brew update
  brew install snowflake-cli
  snow --help
  ```
- pipx (recommended for isolated Python install):
  ```bash
  pipx install snowflake-cli
  snow --help
  ```
- pip (Python 3.10+ required):
  ```bash
  pip install snowflake-cli
  snow --help
  ```

Install options and Python requirement are documented in Snowflake's SnowCLI install guide. citeturn2view1

SnowCLI supports running SQL via `snow sql` in interactive mode or by passing a query/file. citeturn0search3turn2view1

## Configuration

Copy the example vars file and update with your values:

```bash
cp envs/dev/terraform.tfvars.example envs/dev/terraform.tfvars
```

Required variables:
- `snowflake_account`
- `snowflake_user`
- `snowflake_password`
- `snowflake_role`
- `snowflake_warehouse` (bootstrap warehouse for the provider)
- `stage_bucket_raw`
- `stage_bucket_silver`
- `stage_bucket_gold`

### S3 setup (example)

Example AWS CLI commands for raw/silver/gold buckets (replace names/region):

```bash
aws s3api create-bucket --bucket myorg-snowflake-raw --region us-east-1
aws s3api create-bucket --bucket myorg-snowflake-silver --region us-east-1
aws s3api create-bucket --bucket myorg-snowflake-gold --region us-east-1
```

## Usage

Recommended commands (run from repo root):

```bash
terraform -chdir=envs/dev init
terraform -chdir=envs/dev fmt -recursive
terraform -chdir=envs/dev validate
terraform -chdir=envs/dev plan -var-file=terraform.tfvars -out=tfplan
terraform -chdir=envs/dev apply tfplan
```

Destroy (if desired):

```bash
terraform -chdir=envs/dev destroy -var-file=terraform.tfvars
```

### Bootstrap note

Views and dynamic tables require a warehouse in the provider connection. Use an existing warehouse such as `COMPUTE_WH` for `snowflake_warehouse`. If you want to use one of the warehouses created by this project, apply warehouses first:

```bash
terraform -chdir=envs/dev apply -var-file=terraform.tfvars -target=module.warehouses
```

Then update `snowflake_warehouse` and run a full apply.

## Objects created

### Warehouses
- `DEV_WH_SMALL`
- `DEV_WH_MEDIUM`
- `DEV_WH_LARGE`

### Databases
- `HR`
- `FINANCE`
- `MARKETING`

### Tables (5 per database)
- HR: `EMPLOYEES`, `DEPARTMENTS`, `POSITIONS`, `BENEFITS`, `TIME_OFF_REQUESTS`
- FINANCE: `ACCOUNTS`, `TRANSACTIONS`, `BUDGETS`, `INVOICES`, `PAYMENTS`
- MARKETING: `CAMPAIGNS`, `LEADS`, `CHANNELS`, `CONTENT`, `ENGAGEMENTS`

### Sequences
- `HR.PUBLIC.EMPLOYEE_SEQ`
- `HR.PUBLIC.REQUEST_SEQ`
- `FINANCE.PUBLIC.INVOICE_SEQ`
- `FINANCE.PUBLIC.PAYMENT_SEQ`
- `MARKETING.PUBLIC.CAMPAIGN_SEQ`
- `MARKETING.PUBLIC.LEAD_SEQ`

### Views
- HR: `EMPLOYEE_DIRECTORY`, `TIME_OFF_OVERVIEW`
- FINANCE: `OPEN_INVOICES`, `ACCOUNT_ACTIVITY`
- MARKETING: `CAMPAIGN_PERFORMANCE`, `LEAD_SOURCES`

### Streams
- `HR.PUBLIC.EMPLOYEES_STREAM`
- `FINANCE.PUBLIC.INVOICES_STREAM`
- `MARKETING.PUBLIC.LEADS_STREAM`

### Stages (RAW/SILVER/GOLD per database)
- HR: `RAW_STAGE`, `SILVER_STAGE`, `GOLD_STAGE`
- FINANCE: `RAW_STAGE`, `SILVER_STAGE`, `GOLD_STAGE`
- MARKETING: `RAW_STAGE`, `SILVER_STAGE`, `GOLD_STAGE`

### Load data (COPY INTO)

Template:

```sql
COPY INTO "<DB>"."<SCHEMA>"."<TABLE>"
FROM @"<DB>"."<SCHEMA>"."<STAGE>"/<path>/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';
```

Examples (RAW stage -> core tables):

```sql
-- HR
COPY INTO "HR"."PUBLIC"."EMPLOYEES"
FROM @"HR"."PUBLIC"."RAW_STAGE"/employees/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

COPY INTO "HR"."PUBLIC"."DEPARTMENTS"
FROM @"HR"."PUBLIC"."RAW_STAGE"/departments/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

COPY INTO "HR"."PUBLIC"."POSITIONS"
FROM @"HR"."PUBLIC"."RAW_STAGE"/positions/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

COPY INTO "HR"."PUBLIC"."BENEFITS"
FROM @"HR"."PUBLIC"."RAW_STAGE"/benefits/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

COPY INTO "HR"."PUBLIC"."TIME_OFF_REQUESTS"
FROM @"HR"."PUBLIC"."RAW_STAGE"/time_off_requests/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

-- FINANCE
COPY INTO "FINANCE"."PUBLIC"."ACCOUNTS"
FROM @"FINANCE"."PUBLIC"."RAW_STAGE"/accounts/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

COPY INTO "FINANCE"."PUBLIC"."TRANSACTIONS"
FROM @"FINANCE"."PUBLIC"."RAW_STAGE"/transactions/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

COPY INTO "FINANCE"."PUBLIC"."BUDGETS"
FROM @"FINANCE"."PUBLIC"."RAW_STAGE"/budgets/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

COPY INTO "FINANCE"."PUBLIC"."INVOICES"
FROM @"FINANCE"."PUBLIC"."RAW_STAGE"/invoices/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

COPY INTO "FINANCE"."PUBLIC"."PAYMENTS"
FROM @"FINANCE"."PUBLIC"."RAW_STAGE"/payments/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

-- MARKETING
COPY INTO "MARKETING"."PUBLIC"."CAMPAIGNS"
FROM @"MARKETING"."PUBLIC"."RAW_STAGE"/campaigns/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

COPY INTO "MARKETING"."PUBLIC"."LEADS"
FROM @"MARKETING"."PUBLIC"."RAW_STAGE"/leads/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

COPY INTO "MARKETING"."PUBLIC"."CHANNELS"
FROM @"MARKETING"."PUBLIC"."RAW_STAGE"/channels/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

COPY INTO "MARKETING"."PUBLIC"."CONTENT"
FROM @"MARKETING"."PUBLIC"."RAW_STAGE"/content/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

COPY INTO "MARKETING"."PUBLIC"."ENGAGEMENTS"
FROM @"MARKETING"."PUBLIC"."RAW_STAGE"/engagements/
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';
```

Run these with SnowCLI:

```bash
snow sql --query "COPY INTO \"HR\".\"PUBLIC\".\"EMPLOYEES\" FROM @\"HR\".\"PUBLIC\".\"RAW_STAGE\"/employees/ FILE_FORMAT=(TYPE=CSV FIELD_DELIMITER=',' SKIP_HEADER=1) ON_ERROR='CONTINUE';"
```

Or put them in a file (e.g., `copy_into.sql`) and run:

```bash
snow sql --filename copy_into.sql
```

SnowCLI supports ad-hoc queries, files, and interactive mode. citeturn0search3

### Dynamic tables
- `HR.PUBLIC.EMPLOYEE_ROSTER_DT`
- `FINANCE.PUBLIC.DAILY_TRANSACTIONS_DT`
- `MARKETING.PUBLIC.CAMPAIGN_METRICS_DT`

### Transient tables
- HR: `TRN_EMPLOYEE_EVENTS`, `TRN_BENEFIT_ENROLLMENTS`
- FINANCE: `TRN_PAYMENT_EVENTS`, `TRN_GL_STAGING`
- MARKETING: `TRN_LEAD_EVENTS`, `TRN_ATTRIBUTION_EVENTS`

### Temporary tables
- HR: `TMP_PAYROLL_CALC`, `TMP_HIRING_PIPELINE`
- FINANCE: `TMP_FORECAST`, `TMP_CASHFLOW`
- MARKETING: `TMP_SPEND_ALLOCATION`, `TMP_LEAD_SCORES`

## Notes

- `snowflake_table`, `snowflake_sequence`, `snowflake_dynamic_table`, and `snowflake_stage` are preview features in the provider; the configuration enables them via `preview_features_enabled`.
- Stages are defined as external S3 stages. Provide bucket names and a storage integration via `stage_*` variables.
- Transient and temporary tables are created with `snowflake_execute` using SQL. Temporary tables are session-scoped in Snowflake and may be dropped when the provider session ends.
