WITH canal AS (

    SELECT
        id_canal,
        nome_canal,
        tipo_canal,
        custo_estimado,
        taxa_conversao_media,
        leads_gerados,
        clientes_convertidos
    FROM {{ source('Analytics', 'dim_canal') }}
)

SELECT * FROM canal
 