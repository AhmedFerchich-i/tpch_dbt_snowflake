{{ config(materialized='view') }}

with source as (
    select * from {{ source('dbt_learning_sample_data', 'partsupp') }}
),

renamed as (
    select
        -- Composite Primary Key / Foreign Keys
        ps_partkey as part_id,
        ps_suppkey as supplier_id,

        -- Metrics
        cast(ps_availqty as integer) as available_quantity,
        cast(ps_supplycost as numeric(15,2)) as supply_cost,

        -- Attributes
        ps_comment as comment

    from source

    where ps_partkey is not null
      and ps_suppkey is not null
)

select * from renamed