{% macro generate_schema_name(custom_schema_name, node) %}
    {{ return(custom_schema_name if custom_schema_name is not none else target.schema) }}
{% endmacro %}
