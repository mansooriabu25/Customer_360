{% macro null_to_zero(column_name) %}
    COALESCE(
        {{ column_name }},
        0
    )
{% endmacro %}
