{{ 
    config(
        tags = ['comercial']
    )
}}

with vendas as (

    select *
    from {{ ref('int_venda_integral') }}

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