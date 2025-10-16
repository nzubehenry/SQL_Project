WITH top_paying_jobs AS (
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

LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills

FROM top_paying_jobs INNER JOIN skills_job_dim ON
top_paying_jobs.job_id = skills_job_dim.job_id INNER JOIN
skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

ORDER BY salary_year_avg DESC

/**
In 2023, the most valuable and well-compensated data analyst
skill sets combined SQL, Python, Tableau, and cloud technologies
such as Azure and AWS. Analysts who coupled technical depth 
(in SQL/Python) with business intelligence (Tableau/Power BI) 
and cloud integration fetched the highest salaries, often 
exceeding $220K annually
**/