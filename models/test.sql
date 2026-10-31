{{
config (  materialized='view'  )
}}
select * from  {{source ( 'dbt_learning_sample_data','orders' )}}  limit 10