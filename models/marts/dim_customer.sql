{{config(materialized='table')}}
select c.customer_id ,
c.customer_name ,
c.address , 
c.phone , 
c.market_segment ,
c.account_balance,
r.region_id ,
r.region_name ,
n.nation_name,
n.nation_id
from {{ref('stg_customer')}} as c  left join {{ref('stg_nation')}}  as n on c.nation_id=n.nation_id left join {{ref('stg_region')}} as r 
on n.region_id=r.region_id


