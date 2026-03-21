{{ 
    config(
        tags = ['comercial']
    )
}}

with clientes as (
    select * from {{ ref('stg_clientes') }}
),

canais as (
    select * from {{ ref('stg_canal') }}
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