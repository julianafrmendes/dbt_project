WITH vendas AS (

    SELECT
        id_venda,
        id_cliente,
        id_vendedor,
        id_produto,
        id_canal,
        {{ format_date('data_venda') }} AS data_venda,
        desconto,
        ROUND(margem,2) AS margem,
        recorrente

    FROM {{ source('Analytics', 'fato_vendas') }}

)

SELECT * FROM vendas