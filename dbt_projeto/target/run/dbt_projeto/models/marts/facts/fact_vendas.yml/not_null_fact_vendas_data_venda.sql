
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select data_venda
from `dbtproject-489222`.`mart_project_marts`.`fact_vendas`
where data_venda is null



  
  
      
    ) dbt_internal_test