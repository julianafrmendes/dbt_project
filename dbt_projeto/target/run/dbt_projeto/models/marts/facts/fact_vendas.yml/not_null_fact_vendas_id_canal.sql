
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id_canal
from `dbtproject-489222`.`mart_project_marts`.`fact_vendas`
where id_canal is null



  
  
      
    ) dbt_internal_test