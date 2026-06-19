sub query
select *
from (select * from job_postings_fact where extract(month from job_posted_date) = 1)
where job_title_short like 'Senior%';

CTEs
WITH january_jobs AS (
    select *
    from job_postings_fact
    where extract(month from job_posted_date) = 1
)

select * from january_jobs
where job_title_short like '%Data%'
limit 10;

SELECT company_id, name as Company_Name
FROM company_dim
WHERE company_id IN(
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = true
    ORDER BY company_id
);

-- find companies  that have most job postings
WITH company_job_count AS (
    SELECT 
        company_id, 
        COUNT(*) AS total_jobs
    FROM 
        job_postings_fact
    GROUP BY 
        company_id
)

select company_dim.name as company_name, company_job_count.total_jobs 
from company_dim
    LEFT JOIN company_job_count ON company_dim.company_id = company_job_count.company_id
ORDER BY company_job_count.total_jobs DESC;


