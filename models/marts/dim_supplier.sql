{{ config(materialized='table') }}

select
    s.supplier_id,
    s.supplier_name,
    s.address,
    s.phone,
    s.account_balance,
    s.comment,
    n.nation_name,
    n.region_id
from {{ ref('stg_supplier') }} s
left join {{ ref('stg_nation') }} n
    on s.nation_id = n.nation_id
