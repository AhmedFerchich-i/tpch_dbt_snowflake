{{ config(materialized='table') }}

select 

    part_id,
    supplier_id,

   
    supply_cost,
    avail_qty

from {{ ref('stg_partsupp') }}