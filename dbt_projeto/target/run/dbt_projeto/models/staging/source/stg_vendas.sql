
  
    

    create or replace table `dbtproject-489222`.`mart_project_staging`.`stg_vendas`
      
    
    

    
    OPTIONS()
    as (
      WITH vendas AS (

    SELECT
        id_venda,
        id_cliente,
        id_vendedor,
        id_produto,
        id_canal,
        data_venda,
        receita,
        desconto,
        ROUND(receita_liquida,2) AS receita_liquida,
        ROUND(margem,2) AS margem,
        recorrente
    FROM `dbtproject-489222`.`mart_project`.`fato_vendas`
)

SELECT * FROM vendas
    );
  