
{{ 
    config(
        tags = ['comercial']
    )
}}

with oportunidades as (

    select * 
    from {{ ref('stg_oportunidades') }}

),

clientes as (

    select * 
    from {{ ref('stg_clientes') }}

),

vendedores as (

    select * 
    from {{ ref('stg_vendedor') }}

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