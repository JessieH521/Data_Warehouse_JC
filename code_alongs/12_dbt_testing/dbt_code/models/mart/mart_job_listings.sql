WITH fct_job_ads as (select * from {{ ref('fct_job_ads') }}),
job_details as (select * from {{ ref('dim_job_details') }}),
employer as (select * from {{ ref('dim_employer') }})

SELECT
    jd.headline,
    f.vacancies,
    jd.salary_type,
    f.relevance,
    e.employer_name,
    e.workplace_city,
    jd.description,
    jd.description_html_formatted,
    jd.duration,
    jd.scope_of_work_min,
    jd.scope_of_work_max,
    f.application_deadline
FROM fct_job_ads AS f     -- 是事实表 
LEFT JOIN job_details AS jd
    ON f.job_details_key = jd.job_details_id   -- 是事实表 fct_job_ads 里外键（FK）
LEFT JOIN employer AS e
    ON f.employer_key = e.employer_id


/*
创建 MART_JOB_LISTINGS 这个数据集，它是职位信息的最终汇总表（Mart 层），整合了职位广告、职位详情和雇主信息。执行后会生成一个 SQL 视图/表，供业务使用，方便分析职位发布情况
创建一个新的数据集（通常是一个 mart 表），它汇总了 fct_job_ads（事实表）、dim_job_details（工作详情维度表）和 dim_employer（雇主维度表）的数据，用于分析职位列表信息。
*/






