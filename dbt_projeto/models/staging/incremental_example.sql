{{
  config(
    materialized='incremental',
    unique_key='id_venda'
  )
}}

WITH vendas AS (
    SELECT
        id_venda,
        id_cliente,
        id_vendedor,
        id_produto,
        id_canal,
        data_venda,
        desconto,
        ROUND(margem, 2) AS margem,
        recorrente
    FROM {{ source('Analytics', 'fato_vendas') }}

    {% if is_incremental() %}
        -- Este filtro só será aplicado em execuções incrementais
        WHERE data_venda > (SELECT MAX(data_venda) FROM {{ this }})
    {% endif %}
)

SELECT * FROM vendas