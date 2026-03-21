WITH tempo AS (

    SELECT
        data,
        ano,
        mes,
        nome_mes,
        trimestre,
        semana,
        dia,
        dia_semana,
        eh_final_semana,
        dia_util
    FROM {{ source('Analytics', 'dim_tempo') }}
)

SELECT * FROM tempo