-- Top 10 Optimal Skills for Data Scientist in United States

SELECT
sd.skills AS Skills,
MEDIAN (jpf.salary_year_avg) AS Avg_Salary,
COUNT(jpf.*) AS Job_Postings,
ROUND(ROUND(MEDIAN (jpf.salary_year_avg)/ 157000 ,2) * ROUND(LN(COUNT(jpf.*))/ 8.89,2) * 10 ,2) AS Optimal_Score
 FROM 
 job_postings_fact AS jpf

 INNER JOIN skills_job_dim AS sjd
 ON jpf.job_id = sjd.job_id

 INNER JOIN skills_dim AS sd
 ON sjd.skill_id = sd.skill_id
 
 WHERE
 (jpf.job_title_short = 'Data Scientist') AND (jpf.job_country = 'United States')
 AND salary_year_avg IS NOT NULL

GROUP BY
 sd.skills
 
HAVING
COUNT(jpf.salary_year_avg)  > 100

ORDER BY
Optimal_Score DESC

LIMIT 10;

/*
┌────────────┬────────────┬──────────────┬───────────────┐
│   Skills   │ Avg_Salary │ Job_Postings │ Optimal_Score │
│  varchar   │   double   │    int64     │    double     │
├────────────┼────────────┼──────────────┼───────────────┤
│ python     │   132500.0 │         7304 │           8.4 │
│ sql        │   131866.5 │         5509 │          8.15 │
│ r          │   130000.0 │         4307 │           7.8 │
│ spark      │   140000.0 │         1495 │           7.3 │
│ aws        │   135000.0 │         1774 │          7.22 │
│ pytorch    │   145000.0 │          959 │          7.08 │
│ tensorflow │   138500.0 │         1187 │          7.04 │
│ tableau    │   125000.0 │         2075 │          6.88 │
│ azure      │   130000.0 │         1244 │          6.64 │
│ pandas     │   137500.0 │          762 │           6.6 │
└────────────┴────────────┴──────────────┴───────────────┘
*/