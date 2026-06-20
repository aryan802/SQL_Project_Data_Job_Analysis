/*
Question: What are top skills based on salary?
*/

select 
    skills,
    round(avg(salary_year_avg), 0) as avg_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
group by skills
order by avg_salary desc
limit 25