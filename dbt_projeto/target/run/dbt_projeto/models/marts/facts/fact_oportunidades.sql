
  
    

    create or replace table `dbtproject-489222`.`mart_project_marts`.`fact_oportunidades`
      
    
    

    
    OPTIONS()
    as (
      with  __dbt__cte__int_pipeline_oportunidades as (


with oportunidades as (

    select * 
    from `dbtproject-489222`.`mart_project_staging`.`stg_oportunidades`

),

clientes as (

    select * 
    from `dbtproject-489222`.`mart_project_staging`.`stg_clientes`

),

vendedores as (

    select * 
    from `dbtproject-489222`.`mart_project_staging`.`stg_vendedor`

)

select

    o.id_oportunidade,
    o.id_cliente,
    c.segmento,
    c.porte,

    o.id_vendedor,
    v.nome as vendedor,
    v.senioridade,

    o.data_criacao,
    o.data_fechamento,

    DATE_DIFF(o.data_fechamento, o.data_criacao, DAY) as ciclo_venda_dias,

    o.etapa_pipeline,
    o.status,

    o.receita_potencial,
    o.probabilidade_conversao,

    o.motivo_perda

from oportunidades o

left join clientes c
    on o.id_cliente = c.id_cliente

left join vendedores v
    on o.id_vendedor = v.id_vendedor
), oportunidades as(
    select *
    from __dbt__cte__int_pipeline_oportunidades  
)

select * from oportunidades
    );
  