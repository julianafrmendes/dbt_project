WITH vendedores AS (

    SELECT
        id_vendedor,
        nome,
        tempo_empresa_meses,
        senioridade,
        regiao,
        meta_mensal,
        time_comercial,
        status,
        produtividade,
        clientes_ativos
    FROM {{ source('Analytics', 'dim_vendedor') }}
)

SELECT *
FROM vendedores