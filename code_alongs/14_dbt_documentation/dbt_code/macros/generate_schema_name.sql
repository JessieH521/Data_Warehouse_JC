{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}


-- generate_schema_name 是 用于动态生成数据库 schema（模式）名称 的，它决定了 dbt 在数据库中存储表或视图的 schema（命名空间）。 默认如果schema 没有定义，则使用 dbt 运行环境的默认schema（target.schema）。如果 schema 被设置则使用该 schema。




















