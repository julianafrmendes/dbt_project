WITH oportunidade AS (

    SELECT
        id_oportunidade,
        id_cliente,
        id_vendedor,
        id_canal,
        data_criacao,
        data_fechamento,
        etapa_pipeline,
        status,
        receita_potencial,
        probabilidade_conversao,
        motivo_perda
    FROM `dbtproject-489222`.`mart_project`.`fato_oportunidades`
)


SELECT * FROM oportunidade