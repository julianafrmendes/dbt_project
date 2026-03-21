-- seleciona todas as colunas exceto as descritas
SELECT
    id_cliente,
    {{ dbt_utils.star(from=ref('clientes'), except=['id_cliente']) }} 
FROM {{ ref('clientes') }}

--- para criar chaves substitutas em tabelas fato ou dimensões sem depender de uma única coluna da origem
{{ dbt_utils.generate_surrogate_key(['id_venda', 'data_venda']) }} as sk_venda


---Retorna uma lista de valores únicos de uma coluna.
{% set status_list = dbt_utils.get_column_values(table=ref('pedidos'), column='status') %}


--pivotar tabelas
{{ dbt_utils.pivot(column='status', values=['pago', 'pendente', 'cancelado']) }}

---Uma forma limpa de remover duplicatas de uma tabela ou CTE, permitindo que você escolha a coluna de partição e a ordem de preferência.
{{ dbt_utils.deduplicate(relation=ref('vendas'), partition_by='id_venda', order_by='data_venda desc') }}

--- Gera uma tabela de datas (ou horas) contínua entre um início e um fim. Essencial para criar dimensões de tempo ou preencher "buracos" em séries temporais
---dbt_utils.date_spine


--Faz o UNION ALL de várias tabelas (mesmo que elas tenham colunas diferentes ou em ordens distintas). Ele alinha as colunas pelo nome e preenche com NULL onde a coluna não existe.

{{ dbt_utils.union_relations(relations=[ref('vendas_loja_a'), ref('vendas_loja_b')]) }}

--- Executa uma query e retorna os resultados como um dicionário Python (Jinja). Útil para criar lógicas dinâmicas baseadas em metadados do próprio banco
dbt_utils.get_query_results_as_dict

