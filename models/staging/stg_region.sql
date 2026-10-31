{{ config(materialized='view') }}

with source as (
    select * from {{ source('dbt_learning_sample_data', 'region') }}
),

renamed as (
    select
        -- Primary Key
        r_regionkey as region_id,

        -- Attributes
        r_name as region_name,
        r_comment as comment

    from source

    where r_regionkey is not null
)

select * from renamed