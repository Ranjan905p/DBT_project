{% macro calculate_profit(sp, cp, qty) %}
    ({{ sp }} - {{ cp }}) * {{ qty }}
{% endmacro %}
