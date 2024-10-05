WITH top_paying_jobs AS (
SELECT
      job_id,
      job_title,
      salary_year_avg
FROM jobs_fact
LEFT JOIN company_dim ON jobs_fact.company_id = company_dim.company_id
WHERE job_title = 'Data Engineer' AND
      job_location = 'Anywhere' AND
      salary_rate IS NOT NULL
ORDER BY salary_year_avg ASC
)
SELECT 
      top_paying_jobs.*,
      skills
FROM top_paying_jobs
INNER JOIN skill_job_dim ON top_paying_jobs.job_id = skill_job_dim.job_id
INNER JOIN skill_dim ON skill_job_dim.skill_id = skill_dim.skill_id
ORDER BY salary_year_avg ASC;

/*
Count of jobs per skill based on the dataset:

Python: 5 jobs
SQL: 3 jobs
AWS: 3 jobs
Spark: 2 jobs
Redshift: 2 jobs
SQL Server: 2 jobs
Snowflake: 2 jobs
Airflow: 2 jobs
Other skills with 1 job each: Neo4j, Word, Elasticsearch, Redis, PostgreSQL, Bash, Linux, Kafka, Docker, Jira, Terraform, Git, GitHub, SSIS, Tableau, DynamoDB, PySpark, Airtable.
/*