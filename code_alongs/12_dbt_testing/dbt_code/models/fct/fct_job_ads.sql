with ja as (select * from {{ ref('src_job_ads') }}),

jd as (select * from {{ ref('src_job_details') }}),

e as (select * from {{ ref('src_employer') }})

select 
    {{dbt_utils.generate_surrogate_key(['jd.id', 'jd.headline'])}} as job_details_key, 
    -- surrogate_key 也要对应一样的值, 和dim中相对应的 如 e.employer_name 和 employer_id 要相同
    {{dbt_utils.generate_surrogate_key(['e.id', 'e.employer_name'])}} as employer_key, 
    relevance,
    vacancies,
    application_deadline,

    -- for verifying that fk relationship works
    {#
    e.employer_name,
    jd.description #}
from ja
left join   
    jd on ja.id = jd.id        -- join 时 ， surrogate_key 也要对应一样的值
left join 
    e on ja.id = e.id


















