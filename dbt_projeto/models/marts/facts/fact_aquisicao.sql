with aquisicao as(
    select *
    from {{ ref('int_aquisicao_clientes') }}  
)

select * from aquisicao