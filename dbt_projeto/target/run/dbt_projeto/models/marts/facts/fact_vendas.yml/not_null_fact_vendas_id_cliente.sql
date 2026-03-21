
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id_cliente
from `dbtproject-489222`.`mart_project_marts`.`fact_vendas`
where id_cliente is null



  
  
      
    ) dbt_internal_test