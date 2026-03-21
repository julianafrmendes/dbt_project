
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select receita_liquida
from `dbtproject-489222`.`mart_project_marts`.`fact_vendas`
where receita_liquida is null



  
  
      
    ) dbt_internal_test