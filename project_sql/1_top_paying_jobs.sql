/** find the top 10 paying jobs where you can work from home
 for data analyst 
 display the job id, title, location, job schedule type, 
 salary_year_avg, job_posted_date, company name.**/

SELECT
    job_id,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name

FROM job_postings_fact LEFT JOIN company_dim ON
job_postings_fact.company_id = company_dim.company_id

WHERE job_location = 'Anywhere' and
salary_year_avg is not NULL and 
job_title_short = 'Data Analyst'

ORDER BY salary_year_avg DESC

LIMIT 10;