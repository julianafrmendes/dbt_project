
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id_vendedor
from `dbtproject-489222`.`mart_project_marts`.`fact_vendas`
where id_vendedor is null



  
  
      
    ) dbt_internal_test