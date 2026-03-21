{% macro format_date(column_name) %}

SAFE_CAST({{ column_name }} AS DATE)

{% endmacro %}