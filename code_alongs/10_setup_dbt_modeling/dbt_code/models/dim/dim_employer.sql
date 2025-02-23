WITH src_employer AS (SELECT * FROM {{ ref('src_employer') }})

SELECT
    -- 生成 employer_id 作为代理键 surrogate_key
    {{ dbt_utils.generate_surrogate_key(['id', 'employer_name']) }} AS employer_id, -- noqa
    employer_name,
   
    {{ capitalize_first_letter("coalesce(workplace_city, 'stad ej specificerat')") }} AS workplace_city -- noqa: TMP
    {# TODO: finish this dimensional model #} -- noqa
FROM src_employer

 -- 处理 workplace_city，首字母大写，且填充 NULL 值








