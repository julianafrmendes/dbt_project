{{ 
    config(
        tags = ['comercial']
    )
}}

with vendas as (
    select * from {{ ref('stg_vendas') }}
),
clientes as (
    select * from {{ ref('stg_clientes') }}
),
produtos as (
    select * from {{ ref('stg_produto') }}
),
vendedores as (
    select * from {{ ref('stg_vendedor') }}
),
canais as (
    select * from {{ ref('stg_canal') }}
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
