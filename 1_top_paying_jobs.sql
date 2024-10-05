SELECT
      job_id,
      job_title,
      job_location,
      job_schedule_type,
      job_posted_date,
      salary_year_avg
FROM jobs_fact
LEFT JOIN company_dim ON jobs_fact.company_id = company_dim.company_id
WHERE job_title = 'Data Engineer' AND
      job_location = 'Anywhere' AND
      salary_rate IS NOT NULL
ORDER BY salary_year_avg ASC;