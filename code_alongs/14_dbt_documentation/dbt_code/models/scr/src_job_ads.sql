
WITH stg_job_ads AS (SELECT * FROM {{ source('job_ads', 'stg_data_ads') }}
)

SELECT
    id,
    headline,
    number_of_vacancies AS vacancies,
    relevance,
    application_deadline
FROM stg_job_ads ORDER BY application_deadline ASC



-- stg_data_ads 在 sources.yml 中的定义， 是指向 JOB_ADS库/ STAGING schema，名为 data_field_job_ads 的表。















