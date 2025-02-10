with stg_job_ads as (select * from {{ source('job_ads', 'stg_data_ads') }})

select 
    id, 
    employer__name as employer_name, 
    employer__workplace as employer_workplace,
    workplace_address__city as workplace_city
from 
    stg_job_ads


























