-- what are the top paying jobs for my role
-- what are the skills required for these top paying jobs
-- what are the most in demand skills based on salary for my role
-- what are the top skills based on salary for my role
-- what are the most optimal skills to learn
-- a. Optimal: High Demand AND High paying

SELECT 
        skills,
        COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
      job_work_from_home = true
GROUP BY 
skills 
ORDER BY  
demand_count DESC 
LIMIT 5