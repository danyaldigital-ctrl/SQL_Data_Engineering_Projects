 -- Top 10 Heighest paying skills of Data Science in United States
 
SELECT
sd.skills AS Skills,
MEDIAN (jpf.salary_year_avg) AS Avg_Salary,
COUNT(jpf.*) AS Jobs,
COUNT(jpf.salary_year_avg) AS Real_Jobs

 FROM 
 job_postings_fact AS jpf

 INNER JOIN skills_job_dim AS sjd
 ON jpf.job_id = sjd.job_id

 INNER JOIN skills_dim AS sd
 ON sjd.skill_id = sd.skill_id
 
 WHERE
 (jpf.job_title_short = 'Data Scientist') AND (jpf.job_country = 'United States')
 AND (jpf.salary_year_avg IS NOT NULL)
GROUP BY
 sd.skills
 
HAVING
COUNT(jpf.salary_year_avg)  > 100
ORDER BY
MEDIAN (jpf.salary_year_avg) DESC

LIMIT 10;

/*
┌──────────────┬────────────┬───────┐
│    Skills    │ Avg_Salary │ Jobs  │
│   varchar    │   double   │ int64 │
├──────────────┼────────────┼───────┤
│ notion       │   187500.0 │   130 │
│ watson       │   176500.0 │   250 │
│ slack        │   175000.0 │   255 │
│ hugging face │   173500.0 │   586 │
│ dplyr        │   157500.0 │   212 │
│ express      │   157000.0 │   969 │
│ theano       │   152500.0 │   478 │
│ zoom         │   151521.5 │   281 │
│ unify        │   151521.5 │   182 │
│ opencv       │   150000.0 │   616 │
└──────────────┴────────────┴───────┘
*/