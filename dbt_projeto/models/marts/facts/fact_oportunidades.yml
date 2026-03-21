models:
  - name: fact_oportunidades
    description: "Tabela intermediária contendo oportunidades comerciais enriquecidas com informações de clientes e vendedores para análise do pipeline de vendas"

    columns:

      - name: id_oportunidade
        description: "Identificador único da oportunidade"
        tests:
          - not_null
          - unique

      - name: id_cliente
        description: "Identificador do cliente associado à oportunidade"
        tests:
          - not_null

      - name: segmento
        description: "Segmento de mercado do cliente"

      - name: porte
        description: "Porte do cliente (pequeno, médio ou grande)"

      - name: id_vendedor
        description: "Identificador do vendedor responsável pela oportunidade"
        tests:
          - not_null

      - name: vendedor
        description: "Nome do vendedor responsável"

      - name: senioridade
        description: "Nível de senioridade do vendedor"

      - name: data_criacao
        description: "Data em que a oportunidade foi criada"
        tests:
          - not_null

      - name: data_fechamento
        description: "Data em que a oportunidade foi fechada"

      - name: ciclo_venda_dias
        description: "Tempo do ciclo de vendas em dias entre criação e fechamento da oportunidade"

      - name: etapa_pipeline
        description: "Etapa atual da oportunidade no pipeline comercial"

      - name: status
        description: "Status da oportunidade (ganha, perdida ou aberta)"

      - name: receita_potencial
        description: "Valor potencial de receita da oportunidade"

      - name: probabilidade_conversao
        description: "Probabilidade estimada de conversão da oportunidade"

      - name: motivo_perda
        description: "Motivo informado para perda da oportunidade"