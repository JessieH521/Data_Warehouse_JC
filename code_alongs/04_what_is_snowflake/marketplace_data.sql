use database crunchbase_basic_company_data;
show schemas;
use schema public;
show tables;
show views;
select * from organization_summary limit 10;
desc view organization_summary;
select count(*) as number_rows from organization_summary;
select distinct type from organization_summary;
select count(distinct name) as number_unique_names from organization_summary;
select count(distinct country_code) from organization_summary;

select 
    country_code, 
    count(*) as number_organizations
from organization_summary 
group by country_code
order by number_organizations desc;

select 
    country_code, 
    count(*) as number_organizations
from organization_summary 
group by country_code
having country_code in ('SWE', 'DNK', 'NOR', 'FIN', 'ISL')
order by number_organizations desc;

select 
    country_code, 
    region,
    count(*) as number_organizations
from organization_summary 
group by country_code, region
having country_code in ('SWE', 'DNK', 'NOR', 'FIN', 'ISL')
order by number_organizations desc;




















