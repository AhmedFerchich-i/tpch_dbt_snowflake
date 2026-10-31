{{ config(materialized='view') }}

with source as (
    select * from {{ source('dbt_learning_sample_data', 'lineitem') }}
),

renamed as (
    select
        l_orderkey as order_id,
        l_linenumber as line_number,
        l_partkey as part_id,
        l_suppkey as supplier_id,
        cast(l_quantity as integer) as quantity,
        cast(l_extendedprice as numeric(15,2)) as extended_price,
        cast(l_discount as numeric(15,2)) as discount,
        cast(l_tax as numeric(15,2)) as tax,
        l_returnflag as return_flag,
        l_linestatus as line_status,
        cast(l_shipdate as date) as ship_date,
        cast(l_commitdate as date) as commit_date,
        cast(l_receiptdate as date) as receipt_date,
        l_shipinstruct as ship_instruct,
        l_shipmode as ship_mode,
        l_comment as comment
    from source
)

select * from renamed