WITH clientes AS (

    SELECT
        id_cliente,
        nome_empresa,
        segmento,
        porte,
        cidade,
        estado,
        data_primeira_compra,
        canal_aquisicao,
        churn_flag,
        data_churn,
        status_cliente,
        meses_ativo,
        ticket_medio,
        ROUND(ltv_estimado, 2) AS ltv_estimado,
        cluster_cliente
    FROM `dbtproject-489222`.`mart_project`.`dim_cliente`

)

SELECT *
FROM clientes