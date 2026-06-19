-- -- january
-- create table january_jobs as
--     select *
--     from job_postings_fact
--     where EXTRACT(month from job_posted_date) = 1;
-- -- february
-- CREATE TABLE february_jobs AS
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH FROM job_posted_date) = 2;
-- -- march
-- CREATE TABLE march_jobs AS
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH FROM job_posted_date) = 3;


SELECT
    COUNT(job_id) as total_jobs,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York' THEN 'local'
        ELSE 'On-site'
    END AS job_location_type
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
group by job_location_type  ;


