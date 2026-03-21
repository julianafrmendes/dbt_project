with performance_equipe as(
    select *
    from {{ ref('int_performance_vendedor') }}  
)

select * from performance_equipe