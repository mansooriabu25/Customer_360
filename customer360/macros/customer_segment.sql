{% macro customer_segment(revenue_column) %}
    CASE
        WHEN {{ revenue_column }} >= 20000 THEN 'Gold'
        WHEN {{ revenue_column }} >= 5000 THEN 'Silver'
        ELSE 'Bronze'
    END
{% endmacro %}
