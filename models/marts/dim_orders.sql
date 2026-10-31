{{
config (
materialized='table'
)
}}
select  order_id ,
order_date, 
order_status ,
order_priority , 
clerk ,
comment, ship_priority
from {{ref('stg_orders')}}