select job_id, job_title, job_posted_date, job_location
from job_postings_fact
limit 10 ;

-- at timezone utc to specified time zone, without timezone - at -- utc at -- est

select job_id, job_title, job_posted_date at time zone 'utc' at time zone 'est' as job_posted_date_est, job_location
from job_postings_fact
limit 10  ;

-- extract
select 
job_id, 
job_title, 
extract(year from job_posted_date) as year, 
extract(month from job_posted_date) as month, 
extract(day from job_posted_date) as day, 
job_location
from job_postings_fact
limit 10 ;

-- count of jobs per month of data analyst
select 
count(job_id) as job_count,
extract(month from job_posted_date) as month
from job_postings_fact
where job_title_short = 'Data Analyst'
group by month
order by job_count desc;


