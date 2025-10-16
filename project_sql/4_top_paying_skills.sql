SELECT 
    skills,
    Round (AVG (salary_year_avg)) Avg_salary

FROM job_postings_fact INNER JOIN skills_job_dim ON
job_postings_fact.job_id = skills_job_dim.job_id INNER JOIN
skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE job_title_short = 'Data Analyst' AND
salary_year_avg IS NOT NULL
AND job_work_from_home = TRUE

GROUP BY skills

ORDER BY Avg_salary DESC

LIMIT 25;

/** 
Cloud and Big Data Tools Command Premiums
Expertise in cloud platforms (like GCP, Kubernetes) 
and big data frameworks (PySpark, Databricks) drives
some of the highest salaries, highlighting demand for
managing distributed and scalable data systems.

Programming and Data Science Skills Remain Core:
Strong coding skills in Python-related libraries
(Pandas, NumPy, Scikit-learn) and languages like
Go and Scala reflect the critical role of statistical analysis,
machine learning, and efficient data processing in high-paying roles.

DevOps and Collaboration Tools Are Increasingly Valuable:
Knowledge of version control, CI/CD, and team collaboration
tools (Bitbucket, GitLab, Jenkins, Atlassian, Notion) supports
modern data workflows and is rewarded in salary packages.
**/