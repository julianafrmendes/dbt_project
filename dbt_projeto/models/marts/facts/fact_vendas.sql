with vendas as(
    select *
    from {{ ref('int_venda_integral') }}  
)

select * from vendas