WITH produtos AS (

    SELECT
        nome_produto,
        categoria,
        tipo_plano,
        ticket_base,
        margem_percentual,
        recorrencia_meses,
        receita_recorrente,
        margem_contribuicao
    FROM `dbtproject-489222`.`mart_project`.`dim_produto`
)

SELECT *
FROM produtos