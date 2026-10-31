{{ config(materialized='table') }}

select
    li.order_id,
    li.line_number,
    li.part_id,
    li.supplier_id,
    li.quantity,
    li.extended_price,
    li.discount,
    li.tax,
    li.extended_price * (1 - li.discount) as discounted_price,
    li.extended_price * (1 - li.discount) * (1 + li.tax) as total_price,
    li.return_flag,
    li.line_status,
    li.ship_date,
    li.commit_date,
    li.receipt_date,
    li.ship_instruct,
    li.ship_mode
from {{ ref('stg_lineitem') }} as li
