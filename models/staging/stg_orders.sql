{{
    config (
        materialized='view'
    )
}}

with source as (
select * from {{ source('dbt_learning_sample_data','orders') }}
) , 
renamed as (

    -- 2. Transform: Rename, cast, and filter
    select
        -- Primary Key
        o_orderkey as order_id,
        
        -- Foreign Keys
        o_custkey as customer_id,
        
        -- Attributes (Renamed)
        o_orderstatus as order_status,
        o_orderpriority as order_priority,
        o_clerk as clerk,
        o_shippriority as ship_priority,
        o_comment as comment,
        
        -- Metrics (Renamed and Cast)
        cast(o_totalprice as numeric(15,2)) as total_price,
        cast(o_orderdate as date) as order_date

    from source

    -- Filter: Remove invalid records before they enter the pipeline
    where order_id is not null

)

-- 3. Load: Select the final transformed dataset
select * from renamed