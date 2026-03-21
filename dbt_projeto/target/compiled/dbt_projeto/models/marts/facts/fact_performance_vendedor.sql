with  __dbt__cte__int_venda_integral as (


with vendas as (
    select * from `dbtproject-489222`.`mart_project_staging`.`stg_vendas`
),
clientes as (
    select * from `dbtproject-489222`.`mart_project_staging`.`stg_clientes`
),
produtos as (
    select * from `dbtproject-489222`.`mart_project_staging`.`stg_produto`
),
vendedores as (
    select * from `dbtproject-489222`.`mart_project_staging`.`stg_vendedor`
),
canais as (
    select * from `dbtproject-489222`.`mart_project_staging`.`stg_canal`
)

select
    v.id_venda,
    v.data_venda,

    v.id_cliente,
    c.segmento,
    c.porte,
    c.cluster_cliente,

    v.id_vendedor,
    vd.nome as vendedor,
    vd.senioridade,
    vd.regiao,

    v.id_produto,
    p.nome_produto,
    p.categoria,
    p.ticket_base,

    v.id_canal,
    ca.nome_canal,
    ca.tipo_canal,

    v.desconto,
    p.ticket_base * (1 - v.desconto) as receita_liquida,
    v.margem,
    v.recorrente

from vendas v
left join clientes c on v.id_cliente = c.id_cliente
left join produtos p on v.id_produto = p.id_produto
left join vendedores vd on v.id_vendedor = vd.id_vendedor
left join canais ca on v.id_canal = ca.id_canal
),  __dbt__cte__int_performance_vendedor as (


with vendas as (

    select *
    from __dbt__cte__int_venda_integral

)

select

    id_vendedor,
    vendedor,
    senioridade,
    regiao,

    count(id_venda) as vendas_realizadas,

    sum(receita_liquida) as receita_total,

    avg(receita_liquida) as ticket_medio,

    sum(margem) as margem_total

from vendas

group by
    id_vendedor,
    vendedor,
    senioridade,
    regiao
), performance_equipe as(
    select *
    from __dbt__cte__int_performance_vendedor  
)

select * from performance_equipe