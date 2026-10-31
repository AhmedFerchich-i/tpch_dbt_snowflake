# tpch_dbt_snowflake

A dbt project on Snowflake that turns Snowflake's built-in TPC-H sample dataset into a
tested, documented star schema.

## Architecture

```
SNOWFLAKE_SAMPLE_DATA.TPCH_SF1   →   staging (views)   →   marts (dimensions + facts)
```

### Sources
Eight TPC-H tables (`region`, `nation`, `customer`, `orders`, `lineitem`, `part`,
`supplier`, `partsupp`) from `SNOWFLAKE_SAMPLE_DATA.TPCH_SF1`, defined in
`models/sources.yml` with their grain, keys and data tests.

### Staging (`models/staging`)
One `stg_*` model per source table that renames and cleans columns (for example
`c_custkey` → `customer_id`).

### Marts (`models/marts`)
| Model | Type | Description |
|---|---|---|
| `dim_customer` | Dimension | Customers with nation and region attributes added in |
| `dim_orders` | Dimension | Order header details |
| `dim_part` | Dimension | Parts / product catalog |
| `dim_supplier` | Dimension | Suppliers with nation and region attributes |
| `fct_lineitem` | Fact | One row per order line, with `discounted_price` and `total_price` |
| `fct_partsupp` | Fact | One row per part–supplier pair, with supply cost and available quantity |

Models build as views by default, and the fact tables build as tables.

## Data tests
- `unique` and `not_null` on primary keys
- `relationships` tests to check foreign keys across sources and marts

## Getting started

### Prerequisites
- dbt Core with the `dbt-snowflake` adapter (built with dbt 1.9)
- A Snowflake account with access to `SNOWFLAKE_SAMPLE_DATA`

### Setup
1. Clone the repo.
2. Edit the `profiles.yml` connection settings (role, warehouse, database, schema) for your
   account. Supply credentials through your own authentication method, and don't commit them.
3. Run:
   ```bash
   dbt deps    # optional, only if you enable a package in packages.yml
   dbt build   # builds all models and runs all tests
   ```

## Project structure
```
├── models/
│   ├── sources.yml
│   ├── staging/      # stg_* models + schema.yml
│   └── marts/        # dim_* / fct_* models + schema.yml
├── analyses/  macros/  seeds/  snapshots/  tests/
├── dbt_project.yml
├── packages.yml
└── profiles.yml
```
