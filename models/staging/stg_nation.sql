{{ config(materialized='view') }}

with source as (
    select * from {{ source('dbt_learning_sample_data', 'nation') }}
),

renamed as (
    select
        -- Primary Key
        n_nationkey as nation_id,

        -- Foreign Keys
        n_regionkey as region_id,

        -- Attributes
        n_name as nation_name,
        n_comment as comment

    from source

    where n_nationkey is not null
)

select * from renamed