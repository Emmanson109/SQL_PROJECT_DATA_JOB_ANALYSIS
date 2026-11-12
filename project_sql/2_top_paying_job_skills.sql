-- what are the top paying jobs for my role
-- what are the skills required for these top paying jobs
-- what are the most in demand skills based on salary on salary for my role
-- what are the top skills based on salary for my role
-- what are the most optimal skills to learn
-- a. Optimal: High Demand AND High paying

WITH top_paying_jobs AS( -- creating cte name top_paying_jobs
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
job_title_short = 'Data Analyst' AND
job_location = 'Anywhere' AND
salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10 )
-- after creating a temporal result closing the breaket
-- we now select  the result created from the  new table
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;