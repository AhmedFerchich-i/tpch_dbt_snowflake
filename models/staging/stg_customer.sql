{{ config(materialized='view') }}

with source as (
    select * from {{ source('dbt_learning_sample_data', 'customer') }}
),

renamed as (
    select
        -- Primary Key
        c_custkey as customer_id,

        -- Foreign Keys
        c_nationkey as nation_id,

        -- Attributes
        c_name as customer_name,
        c_address as address,
        c_phone as phone,
        c_mktsegment as market_segment,
        
        

       
        cast(c_acctbal as numeric(15,2)) as account_balance

    from source

    where c_custkey is not null
)

select * from renamed