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

    id_cliente,

    count(id_venda) as total_vendas,

    sum(receita_liquida) as receita_total,

    avg(receita_liquida) as ticket_medio_real,

    sum(margem) as margem_total,

    sum(
        case 
            when recorrente = true then receita_liquida 
            else 0 
        end
    ) as receita_recorrente

from vendas

group by id_cliente