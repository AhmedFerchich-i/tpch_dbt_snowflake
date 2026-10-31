{{ config(materialized='table') }}

select
    p.part_id,
    p.part_name,
    p.manufacturer,
    p.brand,
    p.part_type,
    p.part_size,
    p.container,
    p.retail_price,
    p.comment
from {{ ref('stg_part') }} as p
