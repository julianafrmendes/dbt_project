
  
    

    create or replace table `dbtproject-489222`.`mart_project_staging`.`stg_tempo`
      
    
    

    
    OPTIONS()
    as (
      WITH tempo AS (

    SELECT
        data,
        ano,
        mes,
        nome_mes,
        trimestre,
        semana,
        dia,
        dia_semana,
        eh_final_semana,
        dia_util
    FROM `dbtproject-489222`.`mart_project`.`dim_tempo`
)

SELECT * FROM tempo
    );
  