{{ config(materialized='view') }}

with source as (
    select * from {{ source('dbt_learning_sample_data', 'supplier') }}
),

renamed as (
    select
        -- Primary Key
        s_suppkey as supplier_id,

        -- Foreign Keys
        s_nationkey as nation_id,

        -- Attributes
        s_name as supplier_name,
        s_address as address,
        s_phone as phone,
        s_comment as comment,

        -- Metrics
        cast(s_acctbal as numeric(15,2)) as account_balance

    from source

    where s_suppkey is not null
)

select * from renamed