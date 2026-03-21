
    
    

with dbt_test__target as (

  select id_venda as unique_field
  from `dbtproject-489222`.`mart_project_marts`.`fact_vendas`
  where id_venda is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


