show roles;
use role JOB_ADS_DLT_ROLE;
use schema job_ads.staging;
show tables;
desc table data_field_job_ads;
use warehouse dev_wh;
select * from data_field_job_ads;
select 
    relevance, 
    workplace_address__street_address, 
    workplace_address__postcode, 
    publication_date,
    webpage_url,
    source_type
from 
    data_field_job_ads limit 5;

select 
    scope_of_work__min,
    scope_of_work__max,
    employer__name,
    salary_type__label,
    salary_description,
    duration__label,
    logo_url,
    employer__workplace,
    employer__name,
    employer__url
from 
    data_field_job_ads limit 5;

select 
    distinct(salary_description) as different_salary_descripions
from 
    data_field_job_ads limit 5;























