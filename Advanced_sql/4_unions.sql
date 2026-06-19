select 
job_title_short,
company_id,
job_location
FROM
    january_jobs

union

select
job_title_short,
company_id,
job_location
FROM
 february_jobs

union

select
job_title_short,
company_id,
job_location
FROM
    march_jobs;