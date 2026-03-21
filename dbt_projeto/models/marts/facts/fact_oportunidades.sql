with oportunidades as(
    select *
    from {{ ref('int_pipeline_oportunidades') }}  
)

select * from oportunidades