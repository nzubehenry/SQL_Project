WITH high_demand AS (
    SELECT 
    skills,
    skills_dim.skill_id,
    COUNT (skills_job_dim.skill_id) AS demand_skill

FROM job_postings_fact INNER JOIN skills_job_dim ON
job_postings_fact.job_id = skills_job_dim.job_id INNER JOIN
skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE job_title_short = 'Data Analyst' AND
salary_year_avg is not NULL AND
job_work_from_home = TRUE

GROUP BY skills_dim.skill_id

), top_paying_skills AS (
SELECT 
    skills,
    skills_dim.skill_id,
    Round (AVG (salary_year_avg)) Avg_salary

FROM job_postings_fact INNER JOIN skills_job_dim ON
job_postings_fact.job_id = skills_job_dim.job_id INNER JOIN
skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE job_title_short = 'Data Analyst' AND
salary_year_avg IS NOT NULL
AND job_work_from_home = TRUE

GROUP BY skills_dim.skill_id
)

SELECT 

    high_demand.skill_id,
    high_demand.skills,
    demand_skill,
    Avg_salary

FROM high_demand INNER JOIN  top_paying_skills ON
high_demand.skill_id = top_paying_skills.skill_id

WHERE demand_skill > 10

ORDER BY 
Avg_salary DESC,
demand_skill DESC

LIMIT 25;


