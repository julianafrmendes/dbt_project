
  
    

    create or replace table `dbtproject-489222`.`mart_project_marts`.`fact_aquisicao`
      
    
    

    
    OPTIONS()
    as (
      with  __dbt__cte__int_aquisicao_clientes as (
config(
    tags= ['comercial']
)

with clientes as (
    select * from `dbtproject-489222`.`mart_project_staging`.`stg_clientes`
),

canais as (
    select * from `dbtproject-489222`.`mart_project_staging`.`stg_canal`
)

select
    c.id_cliente,
    c.canal_aquisicao,
    ca.tipo_canal,

    -- normalização de custo
    coalesce(ca.custo_estimado, 0) as custo_estimado,

    -- classificação do canal
    case
        when ca.tipo_canal in ('Orgânico', 'Referral') then 'low_cost'
        when ca.tipo_canal = 'Pago' then 'paid'
        else 'unknown'
    end as categoria_custo,

    -- data de aquisição
    c.data_primeira_compra,

    -- regra: flag de aquisição paga
    case
        when ca.tipo_canal = 'Pago' then 1 else 0 end as is_paid_acquisition

from clientes c
left join canais ca
    on c.canal_aquisicao = ca.nome_canal
), aquisicao as(
    select *
    from __dbt__cte__int_aquisicao_clientes  
)

select * from aquisicao
    );
  