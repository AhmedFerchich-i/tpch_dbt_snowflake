{{ config(materialized='view') }}

with source as (
    select * from {{ source('dbt_learning_sample_data', 'part') }}
),

renamed as (
    select
        -- Primary Key
        p_partkey as part_id,

        -- Attributes
        p_name as part_name,
        p_mfgr as manufacturer,
        p_brand as brand,
        p_type as part_type,
        cast(p_size as integer) as part_size,
        p_container as container,
        p_comment as comment,

        -- Metrics
        cast(p_retailprice as numeric(15,2)) as retail_price

    from source

    where p_partkey is not null
)

select * from renamed